require "pry"

class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def funding_rounds
        FundingRound.all.select do |round|
            if round.startup == self
                round.startup
            end
        end
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
        return self
    end

    def self.find_by_founder(founder)
        self.all.find do |startup|
            if startup.founder == founder
                startup.founder
            end
        end
    end

    def self.domains
       self.all.collect do |startup|
        startup.domain
       end 
    end

    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.sum do |funding|
            funding.investment
        end
    end

    def investors
        funding_rounds.collect do |funding|
            funding.venture_capitalist
        end.uniq
    end

    def big_investors
        investors.select do |investor|
            if investor.class.tres_commas_club.include?(investor)
                investor
            end
        end.uniq
    end
end