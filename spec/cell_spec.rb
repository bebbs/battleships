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
  
end