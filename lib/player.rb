class Player

  attr_reader :board

  def initialize(content)
    board_setup(content)
  end

  def board_setup(content)
    @board = content.new(Cell)
  end

end