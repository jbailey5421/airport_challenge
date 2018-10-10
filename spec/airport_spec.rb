require 'airport'
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  before do
    airport.conditions('clear')
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
  end

  it 'has a default capacity' do
    expect(airport.capacity).to eq(50)
  end

  it 'can have a custom capacity' do
    cardiff = Airport.new(100)
    expect(cardiff.capacity).to eq(100)
  end

  it 'control tower knows if the conditions is clear or raining' do
    expect(airport.conditions).to satisfy { 'clear' || 'raining' }
  end

  it 'can allow a plane to land' do
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  it 'does not allow a plane to land if the conditions is raining' do
    airport.conditions('raining')
    expect { airport.land(plane) } .to raise_error 'Authorisation denied. Its raining!'
  end

  it 'allows a plane to land if it is not full' do
    (airport.capacity - 1).times { airport.land(plane) }
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'does not allow a plane to land if it is full' do
    (airport.capacity).times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'Authorisation denied. The airport is full!'
  end

  it 'allows a plane to take off' do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end
  it 'does not allow a plane to take off if the conditions is raining' do
    airport.land(plane)
    airport.conditions('raining')
    expect { airport.take_off(plane) }.to raise_error 'Authorisation denied. Its raining!'
  end
  it 'cannot allow a place to take off if it never landed in the airport' do
    expect { airport.take_off(plane) }.to raise_error 'This plane is not in this airport!'
  end
end