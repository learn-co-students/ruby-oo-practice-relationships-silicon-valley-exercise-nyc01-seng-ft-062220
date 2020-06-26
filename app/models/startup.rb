require 'pry'

require '../models/funding_round.rb'
require '../models/venture_capitalist.rb'


class Startup
  attr_reader :founder, :domain
  attr_accessor :name

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(name)
    @@all.find do |element|
      element.name == name
    end
  end

  def self.domains
    @@all.map do |element|
      element.domain
    end
  end

  def self.all
    @@all
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(venture_capitalist, self, type, investment)
  end

  def num_funding_rounds
    array = FundingRound.all.select do |element|
      element.startup == self
    end
    array.length
  end

  def total_funds
    array = FundingRound.all.select do |element|
      element.startup == self
    end
    total = 0
    array.each do |element|
      total += element.investment
    end
    total
  end

  #Returns a unique array of all the venture capitalists that have invested in this company
  def investors
    array = FundingRound.all.select do |element|
      element.startup == self
    end
    array2 = array.map do |element|
      element.venture_capitalist
    end
    array2.uniq
  end

  def big_investors
    array1 = investors
    array2 = VentureCapitalist.tres_commas_club
    array1.select do |element|
      array2.include?(element)
    end
  end
end




