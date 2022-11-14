class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log, :total_revenue, :spending_money

  def initialize(ride_data)
    @name = ride_data[:name]
    @min_height = ride_data[:min_height]
    @admission_fee = ride_data[:admission_fee]
    @excitement = ride_data[:excitement]
    @rider_log = {}
    @total_revenue = 0
  end

  def board_rider(rider)
    if rider.preferences.include?(@excitement) && rider_log.include?(rider)
      rider_log[rider] += 1
      rider.spending_money -= admission_fee
      @total_revenue += admission_fee
    elsif rider.preferences.include?(@excitement)
      rider_log[rider] = 1
      rider.spending_money -= admission_fee
      @total_revenue += admission_fee
    end
  end
end
