class FundingRound

  @@all = []

  def initialize(venture_capitalist, startup, type, investment)
    @venture_capitalist = venture_capitalist
    @startup = startup
    @type = type
    @investment = investment
    @@all << self

  end

  def startup=(startup)
    @startup = startup
  end

  def startup
    @startup
  end

  def venture_capitalist=(venture_capitalist)
    @venture_capitalist = venture_capitalist
  end

  def venture_capitalist
    @venture_capitalist
  end

  def investment
    @investment
  end

  def type
    @type
  end

  def self.all
    @@all
  end
end
