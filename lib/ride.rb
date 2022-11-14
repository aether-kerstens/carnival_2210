class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log, :total_revenue

  def initialize(ride_data)
    @name = ride_data[:name]
    @min_height = ride_data[:min_height]
    @admission_fee = ride_data[:admission_fee]
    @excitement = ride_data[:excitement]
    @rider_log = {}
    @total_revenue = 0
  end

  def board_rider
    
  end
end
