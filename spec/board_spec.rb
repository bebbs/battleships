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
      ship_double = double :ship_double, size: 3
      expect(board.coordinates(ship_double, :A1, :vertical)).to eq([:A1, :A2, :A3])
    end

    it 'should return the expected coordinates for a vertical ship of size 5' do
      ship_double = double :ship_double, size: 5
      expect(board.coordinates(ship_double, :C2, :horizontal)).to eq([:C2, :D2, :E2, :F2, :G2])
    end

    it 'should recognise if a ship is going outside the grid' do
      expect{board.within_grid([:A9, :A10, :A11])}.to raise_error(RuntimeError, 'You cannot place a ship outside the grid')
    end

    it 'should know that the coordinates are clear, if there are no ships' do
      expect([:A1, :A2, :A3].all? {|cell| board.grid[cell].ship_or_water == :water}).to be true
    end

    it 'should know that the coordinates aren\'t clear, if there are ships' do
      ship_double = double :ship_double
      board.grid[:A1].ship_in_cell!(ship_double)
      expect{board.check_coords_for_ships([:A1, :A2, :A3])}.to raise_error(RuntimeError, 'You cannot place a ship on another ship')
    end

    it 'should be able to place a ship in to a cell' do
      ship_double = double :ship_double
      board.place_ship_in_a_cell(:A1, ship_double)
      expect(board.grid[:A1].ship_object).to eq(ship_double)
    end

    it 'should be able to place a ship in all its coordinates' do
      ship_double = double :ship_double
      board.place_ship_in_all_cells([:A1, :A2, :A3], ship_double)
      expect([:A1, :A2, :A3].all? {|grid_ref| board.grid[grid_ref].ship_object == ship_double}).to be true
    end
 
  end

  context 'integration test for place_ship method' do

    it 'should place a ship in the cells when passed ship, start cell and orientation' do
      ship_double = double :ship_double, size: 4
      board.place_ship(ship_double, :C4, :horizontal)
      expect([:C4, :D4, :E4, :F4].all? {|grid_ref| board.grid[grid_ref].ship_object == ship_double}).to be true
    end

  end


end
