require 'cell'

describe Cell do

let(:cell) {Cell.new}

  context 'a cell when initialised should' do
    
    it 'contain water' do
      expect(cell.content).to eq(:water)
    end

    it 'not be hit' do
      expect(cell.hit?).to eq(false)
    end

  end

  context 'a cell can be' do

    before(:each) {cell.hit!}
    it 'hit' do
      expect(cell).to be_hit
    end

    it 'hit only once' do
      expect(lambda {cell.hit!}).to raise_error(RuntimeError, 'This cell has already been hit.')
    end

  end
  
end