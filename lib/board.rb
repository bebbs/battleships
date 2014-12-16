class Board

  def initialize
    @grid = {}
    [*"A".."J"].each do |letter|
      [*1..10].each do |number|
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

end