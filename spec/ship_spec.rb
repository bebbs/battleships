require 'ship'

describe Ship do

  let(:ship) { Ship.new(:battleship) }
  before(:each) do
    allow(ship).to receive(:type)
  end

  context 'can be created with a' do
    it 'size' do
      expect(ship.size?).to eq(4)
    end
  end
end