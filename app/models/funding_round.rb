require "pry"

class FundingRound

    attr_reader :venture_capitalist, :startup
    attr_accessor :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment < 0 ? investment = 0.0 : investment = investment.to_f
        @@all << self
    end

    def self.all
        @@all
    end

end
