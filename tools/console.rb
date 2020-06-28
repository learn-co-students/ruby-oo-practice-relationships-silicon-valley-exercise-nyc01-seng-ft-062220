require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

business1 = Startup.new("business1", "eli", "landau")
business2 = Startup.new("business2", "yuliya", "flatiron")

cap1 = VentureCapitalist.new("yuliya", 2000000000) 
cap2 = VentureCapitalist.new("eli", 1000000)
cap3 = VentureCapitalist.new("tashawn", 1000000)


round1 = FundingRound.new(business1, cap1, "angel", 50)
round2 = FundingRound.new(business1, cap1, "series a", 75)
round3 = FundingRound.new(business1, cap2, "series a", 75)
round4 = FundingRound.new(business2, cap1, "series c", 100)

#business1.big_investors

cap1.invested("landau")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line