class Board

  attr_reader :grid, :footprint_content, :footprint_array

  def initialize
    @grid = {}
    @columns = [*"A".."J"]
    @rows = [*1..10]
    @columns.each do |letter|
      @rows.each do |number|
        @grid["#{letter}#{number}".to_sym] = Cell.new
      end
    end
  end

  def place_ship(ship, start_cell, orientation)
    coords = [start_cell]
    (ship.size -1).times {coords << next_cell(coords, orientation)}
    within_grid(coords)
    check_coords_for_ships(coords)
    place_ship_in_all_cells(coords, ship)
  end

  def next_cell(coords, orientation)
    orientation == :vertical ? coords.last.next.to_sym : next_horizontal(coords)
  end

  def next_horizontal(coords)
    coords.last.to_s.reverse.next.reverse.to_sym
  end

  def within_grid(coords)
    raise 'You cannot place a ship outside the grid' unless grid.keys & coords == coords
  end

  def check_coords_for_ships(coords)
    raise 'You cannot place a ship on another ship' if coords.any? { |grid_ref| grid[grid_ref].ship_or_water == :ship}
  end

  def place_ship_in_all_cells(coords, ship)
    coords.each {|grid_ref| place_ship_in_a_cell(grid_ref, ship)}
  end

  def place_ship_in_a_cell(grid_ref, ship)
    grid[grid_ref].ship_in_cell!(ship)
  end









  def footprint(size, orientation, start_cell)
    coords = [start_cell]
    orientation == :h ? footprint_horizontal(size, start_cell) : footprint_vertical(size, start_cell)
    outside_grid(size)
  end

    def footprint_horizontal(size, start_cell)
      @footprint_array = []
      @columns[@columns.index(start_cell.to_s.slice(0)), size].each do |column_ref|
        @footprint_array << (column_ref + start_cell.to_s.slice(1)).to_sym
      end
    end

    def footprint_vertical(size, start_cell)
      @footprint_array = []
      @rows[@rows.index(start_cell.to_s.slice(1).to_i), size].each do |row_ref|
        @footprint_array << (start_cell.to_s.slice(0) + row_ref.to_s).to_sym
      end
    end

  def check_footprint(size, footprint)
    outside_grid(size)
    get_footprint_content(footprint)
  end

    def outside_grid(size)
      raise 'Cannot place, ship goes outside grid' if @footprint_array.length != size
    end

    def get_footprint_content(footprint)
      @footprint_content = []
      footprint.each do |grid_ref|
        @footprint_content << grid[grid_ref].ship_or_water
      end
    end

    def check_footprint_unoccupied(array)
      array.all? {|content| content == :water }
    end

  def attempt_place_ship(ship, orientation, start_cell)
    footprint(ship.size?, orientation, start_cell)
    check_footprint(ship.size?, footprint_array)
    place_ship(ship)
  end


end

# place_ship wrapper method