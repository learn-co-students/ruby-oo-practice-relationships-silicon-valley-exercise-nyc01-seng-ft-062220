class VentureCapitalist
    attr_accessor :name, :total_worth

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
        @@all.select {|vc_instance| vc_instance.total_worth > 1000000000 }
    end

    def offer_contract(startup_instance, type, amount)
        FundingRound.new(startup_instance, self, type, amount)
        #   - given a **startup object**, type of investment (as a string), and the amount invested (as a float), 
        #     creates a new funding round and associates it with that startup and venture capitalist.
    end

    def funding_rounds
        FundingRound.all.select{|funding_round_inst| funding_round_inst.vc_instance.name == self.name} 
        #   - returns an array of all funding rounds (these are instances) for that venture capitalist
    end

    def portfolio
        funding_rounds.map {|funding_round_instance| funding_round_instance.startup_instance.name}.uniq
        #   - Returns a **unique** list of all startups this venture capitalist has funded
    end

    def biggest_investment
        funding_rounds.map {|funding_round_instance| funding_round_instance.investment}.max
       # - returns the largest funding round given by this venture capitalist
    end

    def self.invested(domain)
 
        all_inst_of_dom = FundingRound.all.select {|funding_round_instance| funding_round_instance.startup_instance.domain == domain}
        all_inst_of_dom.map {|founding_instance|  founding_instance.investment}.sum
        
         #   - given a **domain string**, returns the total amount invested in that domain
    end

end



# - `VentureCapitalist#name`
#   - returns a **string** that is the venture capitalist's name
# - `VentureCapitalist#total_worth`
#   - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)
# - `VentureCapitalist.all`
#   - returns an array of all venture capitalists
# - `VentureCapitalist.tres_commas_club`
#   - returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)



# - `VentureCapitalist#offer_contract`

# - `VentureCapitalist#funding_rounds`

# - `VentureCapitalist#portfolio`

# - `VentureCapitalist#biggest_investment`

# - `VentureCapitalist#invested`
