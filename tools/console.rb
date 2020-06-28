require_relative '../config/environment.rb'

def reload
  load 'environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
startup_1 = Startup.new("Best Pairing Co", "Best Founder", "Best website")
startup_2 = Startup.new("So-So Pairing Co", "Bad Founder", "Bad website")

venturecap_1 = VentureCapitalist.new("Rich Dude", 9999999999999999)
venturecap_2 = VentureCapitalist.new("Poor Dude", 10)

round1 = FundingRound.new(startup_1, venturecap_1, "Series A", 1000)
round2 = FundingRound.new(startup_1, venturecap_1, "Series B", 2000)
round3 = FundingRound.new(startup_1, venturecap_2, "Series C", 5)
round4 = FundingRound.new(startup_2, venturecap_2, "Series A", 4)

startup_3 = Startup.new("1", "2", "3")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
# binding.pry