class Startup
    attr_accessor :name 
    attr_reader :founder, :pivot, :domain
    #name, founder, domain, pivot, .all 

    @@all = [] 
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        @@all.find {|first| first.founder == founder_name}
    end

    def self.domains
        @@all.map {|ele| ele.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment) 
    end

    def num_funding_rounds
        #FundingRound.all
        FundingRound.all.select {|round| round.startup == self.name}.length
    end

    def total_funds
        total = 0
        FundingRound.all.select {|round| round.startup == self.name}.map do |amount| 
             # if amount.investment
                total += amount.investment
             # end
            end
        return total
    end
    # personal note: if using .each make sure to return a new_array. .each does not create a new array thus will return the original array
    # use Map or select which creates and pushes into a new array 
    def investors
        test1 = FundingRound.all.select {|round| round.startup == self.name}.map do |name|
            name.venture_capitalist
        end
        test1.uniq

       #longer method using .each *not recommend 
       # test1 = [] #test1 is the new array that will store the return values
       # @array1.each do |name| 
       #         test1.push(name.venture_capitalist) #we have to push it somewhere.. since .each will not push anything for us by default... 
       # end
       # test1.uniq 
    end

    def big_investors  #google1.big_investors
     
        big_money = VentureCapitalist.tres_commas_club.map {|names| names.name}
        

        investors_match = FundingRound.all.select {|round| round.startup == self.name}.map do |each|
            #if each.startup == self.name  #[google, google]
                each.venture_capitalist
            #end 
        end
        (big_money & investors_match).uniq
    end

end

