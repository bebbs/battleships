require 'board'

describe Board do

  let(:board) {Board.new}
  
  context 'a grid when initialised should' do
  
    it 'have 100 cells' do
      expect(board.grid.length).to eq(100)
    end

  end

  context 'placing ships' do

    it 'should accept a ship placement instruction (of size 1)' do # how do we do a double gere?
      grid_ref = board.grid[:A1]
      board.place_ship_unit(grid_ref)
      expect(grid_ref.content).to eq(:ship)
    end

    it 'should know which cells to place a ship in' do
      expect(board.footprint(3, :v, :A1)).to eq([:A1, :A2, :A3])
    end

    it 'should return an error if footprint goes outside the grid' do
      expect(lambda{board.footprint(4, :h, :I6)}).to raise_error(RuntimeError, 'Cannot place, ship goes outside grid')
    end

    it 'should know the content of all cells in the footprint' do
      expect(board.check_footprint_content([:A1, :A2, :A3])).to eq([:water, :water, :water])
    end

  end

end