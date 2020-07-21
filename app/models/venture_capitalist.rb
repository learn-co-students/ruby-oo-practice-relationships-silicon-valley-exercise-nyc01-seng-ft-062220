require "pry"

class VentureCapitalist

    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def funding_rounds
        FundingRound.all.select do |round|
            if round.venture_capitalist == self
                round.venture_capitalist
            end
        end
    end

    def self.tres_commas_club
        self.all.collect do |vc|
            if vc.total_worth > 1000000000
                vc
            end
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def portfolio
        funding_rounds.select do |round|
            round.startup
        end.uniq
    end

    def biggest_investment
        funding_rounds.max do |a, b|
            a.investment <=> b.investment
        end
    end

    def invested(domain)
        funding_rounds.sum do |round|
            if round.startup.domain == domain
                round.investment
            end
        end
    end

end
