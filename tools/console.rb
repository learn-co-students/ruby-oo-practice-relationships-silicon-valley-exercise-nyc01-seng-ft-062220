require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
google1 = Startup.new("Google", "Nick", "www.google.com")
google2 = Startup.new("Google", "David", "www.google.com")
google3 = Startup.new("Google", "William", "www.google.com")
fire1 = Startup.new("FireFox", "Nick", "www.firefox.com")
fire2 = Startup.new("FireFox", "James", "www.firefox.com")
fire3 = Startup.new("FireFox", "Amy", "www.firfox.com")

hit1 = FundingRound.new("Google", "Nick", "invest", 2417923712893)
hit2 = FundingRound.new("dev", "Steven", "mom", 20101201)
hit3 = FundingRound.new("Google","David", "savings", 9595959595)
hit4 = FundingRound.new("Google", "Nick", "invest", 91278312984612948)
hit5 = FundingRound.new("dev", "James", "mom", 20101201)
hit6 = FundingRound.new("Zoom","Amy", "pepp", 123123213123123)

venture1 = VentureCapitalist.new("David", 4000012312312131000)
venture2 = VentureCapitalist.new("Nick", 1000000000000)
venture3 = VentureCapitalist.new("Nick", 12121000000000000)
venture4 = VentureCapitalist.new("Amy", 32323000000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line