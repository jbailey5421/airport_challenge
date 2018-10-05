require 'airport'

describe Airport do
    subject(:airport) { described_class.new }
    let(:fakePlane) { double :plane }
describe '#land', :land do
        it { is_expected.to respond_to(:land).with(1).argument }
end
it 'parks plane on the tarmac' do
    subject.land(:fakePlane)
    expect(subject.tarmac).to include (:fakePlane)
end
describe '#take_off', :take_off do    
      it { is_expected.to respond_to(:take_off).with(1).argument }
end
    
    
end