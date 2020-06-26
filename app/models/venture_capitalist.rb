require 'pry'

require_relative '../models/funding_round.rb'
require_relative '../models/startup.rb'


class VentureCapitalist
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def name
    @name
  end

  def total_worth
    @total_worth
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    @@all.select do |element|
      element.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(self, startup, type, amount)
  end

  def funding_rounds
    FundingRound.all.select do |element|
      element.venture_capitalist == self
    end
  end

  def portfolio
    array = self.funding_rounds.map do |element|
      element.startup
    end
    array.uniq
  end

  def biggest_investment
    max_amount = 0
    max_funding_round = self.funding_rounds[0]
    self.funding_rounds.each do |element|
      if element.investment > max_amount
        max_amount = element.investment
        max_funding_round = element
      end
    end
    max_funding_round
  end

  def invested(domain)
    amount = 0
    self.funding_rounds.each do |element|
      if element.startup.domain == domain
        amount += element.investment
      end
    end
    amount
  end
end