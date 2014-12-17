require 'board'

describe Board do

  let(:board) {Board.new}

  context 'a grid when initialised should' do
  
    it 'have 100 cells' do
      expect(board.grid.length).to eq(100)
    end

  end
  
  context 'refactoring place ships methods' do

    it 'should return the expected coordinates for a vertical ship of size 3' do
      expect(board.coordinates(3, :A1, :vertical)).to eq([:A1, :A2, :A3])
    end

    it 'should return the expected coordinates for a vertical ship of size 5' do
      expect(board.coordinates(5, :C2, :horizontal)).to eq([:C2, :D2, :E2, :F2, :G2])
    end

  end

  context 'placing ships' do


    it 'should return an error if footprint goes outside the grid' do
      expect{board.footprint(4, :h, :I6)}.to raise_error(RuntimeError, 'Cannot place, ship goes outside grid')
    end

    it 'should know the content of all cells in the footprint' do
      board.get_footprint_content([:A1, :A2, :A3])
      expect(board.footprint_content).to eq([:water, :water, :water])
    end

    it 'should return true if the footprint is clear of ships' do
      expect(board.check_footprint_unoccupied([:water, :water, :water])).to be true
    end

    it 'should return false if the footprint is not clear of ships' do
      expect(board.check_footprint_unoccupied([:water, :ship, :water])).to be false
    end

    it 'should be able to place a ship in it\'s footprint' do
      ship_double = double(:ship)
      board.footprint(3, :v, :A1)
      board.footprint_array.each { |cell| board.grid[cell].ship_in_cell!(ship_double) }
      board.get_footprint_content(board.footprint_array)
      expect(board.footprint_content.all? {|ship| ship == :ship}).to eq(true)
    end

    it 'should place a ship' do
      ship_double = double(:ship_double)
      allow(ship_double).to receive(:size?).and_return(3)
      board.attempt_place_ship(ship_double, :v, :A1)
      board.get_footprint_content([:A1, :A2, :A3])
      expect(board.footprint_content.all? {|ship| ship == :ship}).to eq true 
    end

  end

end

# doubles to isolate item being tested