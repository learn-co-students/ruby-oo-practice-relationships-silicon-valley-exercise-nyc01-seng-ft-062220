require "pry"
require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


# (name, founder, domain)
su1 = Startup.new("business", "Alex", "tech")
su2 = Startup.new("apps", "Avi", "music")
su3 = Startup.new("copycat", "N/A", "fake")
su4 = Startup.new("stuff", "Alex", "tech")

# (name, total_worth)
vc1 = VentureCapitalist.new("Bill", 1000000001)
vc2 = VentureCapitalist.new("Rob", 999999999)

# (startup, venture_capitalist, type, investment)
fr1 = FundingRound.new(su1, vc1, "A", 60000)
fr2 = FundingRound.new(su2, vc2, "A", 10000)
fr3 = FundingRound.new(su3, vc2, "Seed", -10)
fr4 = FundingRound.new(su4, vc1, "A", 10000)

Startup.find_by_founder("Alex")

Startup.domains

su3.pivot("news", "original")

VentureCapitalist.tres_commas_club

newone = su1.sign_contract(vc2, "B", 10)

su1.funding_rounds

su1.num_funding_rounds

su1.total_funds

su1.investors

su1.big_investors

vc2.funding_rounds

vc1.portfolio

vc2.biggest_investment

vc1.invested("tech")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line