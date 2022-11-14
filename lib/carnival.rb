class Carnival
  attr_reader :name,
              :duration,
              :rides

  def initialize(name, duration)
    @name     = name
    @duration = duration
    @rides    = []
  end

  def add_ride(ride)
    @rides << ride)
  end

  def most_popular
    @rides.max_by do |ride|
      ride.total_count
    end
  end

  def most_profitable

  end

  def total_revenue
    
  end
end
