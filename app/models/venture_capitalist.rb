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

    def self.tres_commas_club
        @@all.select{|vc| vc.total_worth > 1000000000}
    end

    #startup object, type string, investment float
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    # this is used as a helper method for VentureCapitalist #portfolio, #biggest_investment, invested
    def funding_rounds
        FundingRound.all.map { |round| round if round.venture_capitalist == self }.compact
    end

    def portfolio
        funding_rounds.collect { |self_round| self_round.startup } #select vs #collect here -- is it consequential? ## it is... b/c i'm trying to grab precise data... "self_round.startup" ... if i just wanted self_round, select method is fine
    end
    
    def biggest_investment
        funding_rounds.max_by {|self_round| self_round.investment }
    end

    # Solved issues nil typeerror with `.compact` since ruby 2.6.1 does not have '.filter_map'
    # TODO - refactor the below code... is map the best way to solve this problem? re: large dataset?
    def invested(domain)
        #funding_rounds.sum { |self_round| self_round.investment if self_round.startup.domain == domain }.compact
        funding_rounds.map { |self_round| self_round.investment if self_round.startup.domain == domain }.compact.sum
    end
    
end



