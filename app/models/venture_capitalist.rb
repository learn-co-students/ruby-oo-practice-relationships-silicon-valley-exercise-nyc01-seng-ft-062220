require "pry"

class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|cap| cap.total_worth > 1000000000}
    end

    def offer_contract (startup, type, investment)
        FundingRound.new(startup, self, type, investment)
        #binding.pry
    end

    def funding_rounds
        fund_rounds = []
        FundingRound.all.map do |round|
            if round.venture_capitalist == self
                fund_rounds << round.venture_capitalist
            end
        end
        fund_rounds.count
    end

    def portfolio
        portfolios = []
        FundingRound.all.map do |round|
            if round.venture_capitalist == self
                portfolios << round.startup
            end
        end
        portfolios.uniq
    end

    def biggest_investment
        biggest_investment = []
        FundingRound.all.select do |round|
            round.venture_capitalist == self
            biggest_investment << round.investment
        end
        biggest_investment.max
    end

    def invested (domain_name)
        invest = []
        invest_amount = []
        self.portfolio.select do |start|
            #binding.pry
           if start.domain == domain_name
                invest_amount << start
           end
        end
        FundingRound.all.map do |round|
            if round.startup == invest_amount
                invest << round.investment
                binding.pry
            end
        end
        invest.reduce
    end

end

cap1 = VentureCapitalist.new("yuliya", 2000000000) 
cap2 = VentureCapitalist.new("eli", 1000000) 


#binding.pry