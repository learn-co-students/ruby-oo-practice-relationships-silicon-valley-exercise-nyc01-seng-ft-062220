class VentureCapitalist
    attr_accessor :name
    attr_reader :total_worth
    
    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        VentureCapitalist.all << self #@@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|capital| capital.total_worth > 1000000000}
    end
    
    def offer_contract(startup, type, amounut)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self.name}
    end

    def portfolio
        port = funding_rounds.map do |name|
            name.startup
        end
        port.uniq
    end

    def biggest_investment
        biggest_total = 0
        self.funding_rounds.map do |amount|
             if amount.investment > biggest_total
                biggest_total = amount.investment
            end
        end
        biggest_total
    end

    #def invested(domain_name) #parameter for domain / return the total amount invested in domain 
        #domain is stored in startup class
         #test1 = Startup.all.map do |ele| #careful when using map, it will also collect nil....
             #if ele.domain == domain_name #check to see if domains match
                #ele.founder #collect only names of matching domain_name
             #end
        #end
        
        
        #founder_names = test1.compact 
        #total = 0

        #founder_names.each do |founder|
        #a way to not use compact
         # [domains only] 
         #match this with funding_round to get the money sum 
        #FundingRound.all.each do |each|
            #if (each.venture_capitalist == founder)
                #total += each.investment
            #end
        #end
    #end
    #total
    #end

end

