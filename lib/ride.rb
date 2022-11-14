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
    if rider.preferences.include?(@excitement) && rider.tall_enough?(@min_height) == true
      if rider_log.include?(rider)
        rider_log[rider] += 1
        @total_revenue += admission_fee
        rider.ticket_fee(admission_fee)
      else
        rider_log[rider] = 1
        @total_revenue += admission_fee
        rider.ticket_fee(admission_fee)
      end
    else
      return
    end
  end
end
