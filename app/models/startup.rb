require "pry"

class Startup 
    attr_accessor :name, :domain
    attr_reader :founder
    @@all = []

    def initialize (name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self

    end

    def pivot (name, domain)
        self.name = name
        self.domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder (founder_name)
        self.all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract (venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
        #binding.pry
    end

    def num_funding_rounds
        num_rounds = []
        FundingRound.all.map do |round|
            if round.startup == self
                num_rounds << round.startup
            end
        end
        num_rounds.count
    end
    
    def total_funds
        total_invest = []
        FundingRound.all.map do |round|
            if round.startup == self
                total_invest << round.investment
            end
        end
        total_invest.reduce(0) {|sum, n| sum + n}
    end

    def investors
        investors = []
        FundingRound.all.map do |round|
            if round.startup == self
                investors << round.venture_capitalist
            end
        end
        investors.uniq
    end

    def big_investors
        self.investors.select {|investor| investor.total_worth > 1000000000}
    end



end

# business1 = Startup.new("business1", "eli", "landau")
# business2 = Startup.new("business2", "yuliya", "flatiron")

#cap1 = VentureCapitalist.new("yuliya", 2000000000) 

#binding.pry
