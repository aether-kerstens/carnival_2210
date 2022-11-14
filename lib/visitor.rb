class Visitor
  attr_reader :name, :hieght, :spending_money, :preferences

  def initialize(name, hieght, spending_money)
    @name = name
    @hieght = hieght
    @spending_money = set_money(spending_money)
    @preferences = []
  end

  def set_money(spending_money)
    spending_money.delete('$').to_f
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(required_hieght)
    if required_hieght > @hieght
      false
    else
      true
    end
  end
end
