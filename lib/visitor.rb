class Visitor
  attr_reader :name, :hieght, :spending_money, :preferences

  def initialize(name, hieght, spending_money)
    @name = name
    @hieght = hieght
    @spending_money = spending_money
    @preferences = []
  end

  def tall_enough?(required_hieght)
    required_hieght >= @hieght
  end
end
