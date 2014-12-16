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

  def place_ship_unit(grid_ref)
    grid_ref.ship_in_cell!
  end

  def footprint(size, orientation, start_cell)
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

  def outside_grid(size)
    raise 'Cannot place, ship goes outside grid' if @footprint_array.length != size
  end

  def check_footprint_content(footprint)
    @footprint_content = []
    footprint.each do |grid_ref|
      @footprint_content << grid[grid_ref].content
    end
  end

  def footprint_unoccupied(array)
    array.any? {|content| content == :water }
  end

end