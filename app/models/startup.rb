class Startup

    attr_reader :founder
    attr_accessor :domain, :name
    
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        
    end

    def pivot(new_domain, new_name)
        @domain = new_domain
        @name = new_name
    end
    
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        arr_funding_rounds.count { |self_round_instance| self_round_instance }
        #Commented out to try helper method in order to reduce repetition for my total_funds instance method, which starts on line 31
        #FundingRound.all.count { |round| round.startup == self }
    end

    def total_funds
        arr_funding_rounds.sum { |self_round| self_round.investment }
    end

    def investors
        arr_funding_rounds.uniq { |self_round| self_round.venture_capitalist }
    end

    #? do I want to access venture_cap_class_method directly along with its class variable all or should I strive to point all data "requests" to my funding_round_class as my SSOT?
    #! tres_commas_club is a class method; my data below is instance vars
    #startup_1.investors.select {|x| x.venture_capitalist.total_worth == }
    #VentureCapitalist.tres_commas_club.include?(startup_1.investors[0].venture_capitalist) #*=> true
    #TODO - refactor big investors
        #? get clarification on this deliverable... should the return value be from the venture_capitalist class rather than round??
    def big_investors
        investors.map { |investor| investor.venture_capitalist if VentureCapitalist.tres_commas_club.include?(investor.venture_capitalist) }.compact
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        @@all.find { |startup| startup.founder == founder_name }
    end

    def self.domains
        @@all.map { |startup| startup.domain } 
    end

    # Helper Method for num_funding and total_fund
    #* helper method is collecting round data and will use it to count instances of rounds of self AND contains investment data for future total calc
    def arr_funding_rounds
        FundingRound.all.map { |round| round if round.startup == self }.compact
    end
    
end