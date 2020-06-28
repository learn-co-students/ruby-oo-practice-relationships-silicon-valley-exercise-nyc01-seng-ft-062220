class FundingRound
    
    attr_reader :venture_capitalist, :investment, :startup
    attr_accessor :type

    @@all = []
     
    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        #@investment = investment
        self.investment = investment
        @@all << self
    end

    def investment=(investment)
        if investment >= 0
            return @investment = investment.to_f
        else
            return @investment = 0.0
        end
    end

    def self.all
        @@all
    end

end