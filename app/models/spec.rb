require 'pry'

require '../models/funding_round.rb'
require '../models/venture_capitalist.rb'
require '../models/startup.rb'


company1 = Startup.new('Microsoft', 'Bill Gates', 'Microsoft.com')
company2 = Startup.new('Apple', 'Steve Jobs', 'Apple.com')
company3 = Startup.new('Google', 'Somebody', 'google.com')

venture_1 = VentureCapitalist.new('bob', 10000000000)
venture_2 = VentureCapitalist.new('tom', 10000000000)
venture_3 = VentureCapitalist.new('Susan', 1000000)
venture_4 = VentureCapitalist.new('Terry', 100000)
venture_5 = VentureCapitalist.new('Alyson', 10000)
venture_6 = VentureCapitalist.new('Sandra', 10000)

funding1 = FundingRound.new(venture_1, company1, 'A', 55)
funding2 = FundingRound.new(venture_1, company1, 'B', 1500)
funding3 = FundingRound.new(venture_1, company1, 'B', 1400)
funding4 = FundingRound.new(venture_4, company1, 'B', 1300)
funding5 = FundingRound.new(venture_5, company1, 'B', 1500)
funding6 = FundingRound.new(venture_6, company1, 'B', 1200)

puts(venture_1.invested('Microsoft.com'))