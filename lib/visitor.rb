class Visitor
  attr_reader :name, :height, :spending_money, :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = set_money(spending_money)
    @preferences = []
  end

  def set_money(spending_money)
    spending_money.delete('$').to_i
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(required_height)
    if required_height > @height
      false
    else
      true
    end
  end

  def ticket_fee(ticket)
    @spending_money -= ticket
  end
end
