class Board

  attr_reader :grid

  def initialize(content)
    @grid = {}
    columns = [*"A".."J"]
    rows = [*1..10]
    columns.each {|l| rows.each {|n| @grid["#{l}#{n}".to_sym] = content.new}}
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

end
