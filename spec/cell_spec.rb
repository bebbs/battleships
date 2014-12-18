require 'cell'

describe Cell do

let(:cell) {Cell.new}

  context 'a cell when initialised should:' do
    
    it 'contain water' do
      expect(cell.ship_or_water).to eq(:water)
    end

    it 'not be hit' do
      expect(cell.hit).to eq(false)
    end

  end

  context 'a cell can be:' do

    before(:each) {cell.hit!}
    it 'hit' do
      expect(cell.hit).to be true
    end

    it 'hit only once' do
      expect{cell.hit!}.to raise_error(RuntimeError, 'This cell has already been hit.')
    end

  end

  context 'receiving ships' do

    let(:ship_double) {double :ship_double}
    before(:each) {cell.ship_in_cell!(ship_double)}

    it 'should be capable of receiving a ship in it' do
      expect(cell.ship_or_water).to eq(:ship)
    end

  end

  context 'receiving a specific ship' do

    it 'should know which ship object is placed in it' do
      ship = double(:ship)
      cell.ship_in_cell!(ship)
      expect(cell.ship_object).to eq(ship)
    end

  end

end