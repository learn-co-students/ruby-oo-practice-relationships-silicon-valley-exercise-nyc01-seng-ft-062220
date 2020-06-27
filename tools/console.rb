require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

google = Startup.new("google", "alex", "sorta evil")
facebook = Startup.new("facebook", "zuck", "evil")
new_facebook = Startup.new("new_facebook", "zuck", "evil")

bill_gates = VentureCapitalist.new("BillGates", 9999999999)
shmill_shmates = VentureCapitalist.new("ShimillShmates", 1)

payday = FundingRound.new(facebook, bill_gates, "Angel", 9)
payday2 = FundingRound.new(facebook, shmill_shmates, "A_series", 20)
payday3 = FundingRound.new(facebook, shmill_shmates, "angel", 20)
payday4 = FundingRound.new(google, shmill_shmates, "b-series", 500)

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line