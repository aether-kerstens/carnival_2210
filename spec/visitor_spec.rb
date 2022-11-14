require './lib/visitor'

RSpec.describe Visitor do
  it '#exists' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1).to be_an_instance_of(Visitor)
  end

  it 'has name' do
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1.name).to eq('Bruce')
  end

  it 'has a height' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1.height).to eq(54)
  end

  it 'has spending money' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1.spending_money).to eq(10)
  end

  it 'has no preferences' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1.preferences).to eq([])
  end

  it 'can acquire preferences' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor1.add_preference(:gentle)
    visitor1.add_preference(:water)
    expect(visitor1.preferences).to eq([:gentle, :water])
  end

  it 'can check if tall tall_enough' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    expect(visitor1.tall_enough?(54)).to eq(true)
  end

  it 'can check if not tall enough' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    expect(visitor2.tall_enough?(54)).to eq(false)
    expect(visitor3.tall_enough?(54)).to eq(true)
    expect(visitor1.tall_enough?(64)).to eq(false)
  end
end
