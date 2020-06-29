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
    def funding_rounds
        FundingRound.all.map do |round|
            if round.startup == self
                return 
            end
        end
    end
end