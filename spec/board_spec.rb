require 'board'

describe Board do

  let(:board) {Board.new}
  
  context do 'a grid when initialised should'
  
    it 'have 100 cells' do
      expect(board.grid.length).to eq(100)
    end

  end

  context do 'placing ships'

    it 'should accept a ship placement instruction (of size 1)' do # how do we do a double gere?
      grid_ref = board.grid[:A1]
      board.place_ship_unit(grid_ref)
      expect(grid_ref.content).to eq(:ship)
    end

    it 'should know which cells to place a ship in' do
      expect(board.footprint(3, :v, :A1)).to eq([:A1, :A2, :A3])
    end

  end

end