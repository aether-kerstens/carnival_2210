require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new("Super Sick Carnival", "1 Week")
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
  end

  it '#exists' do
    expect(@carnival).to be_a(Carnival)
  end

  it 'has a name' do
    expect(@carnival.name).to eq("Super Sick Carnival")
  end

  it 'has duration' do
    expect(@carnival.duration).to eq("1 Week")
  end

  it 'has no rides' do
    expect(@carnival.rides).to eq([])
  end

  it 'can add rides' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
    expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
  end

  it 'can determine the most popular ride' do
    @visitor1.add_preferences(:gentle)
    @visitor2.add_preferences(:gentle)
    @visitor3.add_preferences(:thrilling)
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    7.times do @ride1.board_rider(@visitor1)
    end
    expect(@carnival.most_popular).to eq(@ride1)
    3.times do @ride2.board_rider(@visitor2)
    end
    expect(@carnival.most_popular).to eq(@ride1)
  end

  it 'has a most profitable ride' do
    @visitor1.add_preferences(:gentle)
    @visitor2.add_preferences(:gentle)
    @visitor3.add_preferences(:thrilling)
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    7.times do @ride1.board_rider(@visitor1)
    end
    expect(@carnival.most_popular).to eq(@ride1)
    3.times do @ride2.board_rider(@visitor2)
    end
    expect(@carnival.most_popular).to eq(@ride2)
  end

  it 'has total revenue' do
    @visitor1.add_preferences(:gentle)
    @visitor2.add_preferences(:gentle)
    @visitor3.add_preferences(:thrilling)
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    7.times do @ride1.board_rider(@visitor1)
    end
    expect(@carnival.most_popular).to eq(@ride1)
    3.times do @ride2.board_rider(@visitor2)
    end
    expect(@carnival.most_popular).to eq(@ride2)
    expect(carnival.total_revenue).to eq(4)

    5.times do ride.board_rider(visitor1)
    end
    expect(carnival.total_revenue).to eq(9)

  end
