class Startup
    attr_reader :founder, :domain, :name

    @@all = []

    FUND_ALL = FundingRound.all

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
        #   - should return **all** of the startup instances
    end

    def self.domains
        @@all.map {|ele| ele.domain}
        #   - should return an **array** of all of the different startup domains
    end

    

    def self.find_by_founder(founder_name)
        @@all.find {|ele| ele.founder == founder_name}
        #   - given a string of a **founder's name**, returns the **first startup** whose founder's name matches
    end

    def pivot=(domain, name)
        @domain = domain
        @name = name
        #   - given a string of a **domain** and a string of a **name**, change the domain
        #     and name of the startup. This is the only public method through which the
        #     domain should be changed.
    end

    def sign_contract(vc_instance, type, amount)
        FundingRound.new(self, vc_instance, type, amount)
        #   - given a **venture capitalist object**, type of investment (as a string), and the amount invested (as a float), 
        #     creates a new funding round and associates it with that startup and venture capitalist.
    end

    def num_funding_rounds   # **NEW**
        count = 0
        FUND_ALL.map {|funding_round| count += 1 if funding_round.startup_instance.name == self.name}
        count
        #   - Returns the total number of funding rounds that the startup has gotten
    end

    def total_funds  # **NEW**
        total = FUND_ALL.map {|funding_round| funding_round.investment if funding_round.startup_instance.name == self.name}
        total.delete_if {|num| num == nil}
        total.sum
        #   - Returns the total sum of investments that the startup has gotten
    end

    def investors # **NEW**
        investors = FUND_ALL.map {|funding_round| funding_round.vc_instance.name if funding_round.startup_instance.name == self.name}
        investors.delete_if {|investor| investor == nil}
        investors.uniq
        #   - Returns a **unique** array of all the venture capitalists that have invested in this company
    end

    def big_investors # **NEW**
        investors = FUND_ALL.map {|funding_round| funding_round.vc_instance.name if funding_round.vc_instance.total_worth > 1000000000} 
        investors.delete_if {|investor| investor == nil}
        investors.uniq
        #   - Returns a **unique** array of all the venture capitalists that have invested in this company and are in the Trés Commas club
    end


end


# - `Startup#name`
#   - returns a **string** that is the startup's name
# - `Startup#founder`
#   - returns a **string** that is the founder's name
#   - Once a startup is created, the founder cannot be changed.
# - `Startup#domain`
#   - returns a **string** that is the startup's domain
# - `Startup#pivot`


# - `Startup#sign_contract`
# - `Startup#num_funding_rounds`
# - `Startup#total_funds`
# - `Startup#investors`
# - `Startup#big_investors`
