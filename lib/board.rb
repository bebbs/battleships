class Board

  attr_reader :grid

  def initialize(content)
    @grid = {}
    columns = [*"A".."J"]
    rows = [*1..10]
    rows.each {|n| columns.each {|l| @grid["#{l}#{n}".to_sym] = content.new}}
    end

  def place_ship(ship, start_cell, orientation)
    coords = coordinates(ship, start_cell, orientation)
    put_on_grid_if_possible(coords, ship)
  end

  def coordinates(ship, start_cell, orientation)
    coords = [start_cell]
    ((ship.size) -1).times {coords << next_cell(coords, orientation)}
    coords
  end

  def put_on_grid_if_possible(coords, ship)
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

  def cell_object(grid_ref)
    grid[grid_ref]
  end

  def display_own_grid
    row1 = grid.keys[0..9]
    row2 = grid.keys[10..19]
    row3 = grid.keys[20..29]
    row4 = grid.keys[30..39]
    row5 = grid.keys[40..49]
    row6 = grid.keys[50..59]
    row7 = grid.keys[60..69]
    row8 = grid.keys[70..79]
    row9 = grid.keys[80..89]
    row10 = grid.keys[90..99]
    p row1
    p row2
    p row3
    p row4
    p row5
    p row6
    p row7
    p row8
    p row9
    p row10
  end



end
