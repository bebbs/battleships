class Board

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

  def grid
    @grid
  end

  def place_ship_unit(grid_ref)
    grid_ref.ship_in_cell!
  end

  def footprint(size, orientation, start_cell)
    array = []
    if orientation == :h
      @columns[@columns.index(start_cell.to_s.slice(0)), size].each do |column_ref|
        array << (column_ref + start_cell.to_s.slice(1)).to_sym
      end
    elsif orientation == :v
      @rows[@rows.index(start_cell.to_s.slice(1).to_i), size].each do |row_ref|
        array << (start_cell.to_s.slice(0) + row_ref.to_s).to_sym
      end
    else raise "Unrecognised orientation"
    end
    raise 'Cannot place, ship goes outside grid' if array.length != size
    array
  end

  def check_footprint_content(footprint)
    array = []
    footprint.each do |grid_ref|
      array << grid[grid_ref].content
    end
    array
  end

end