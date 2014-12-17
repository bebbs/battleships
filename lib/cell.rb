class Cell

  def initialize 
    @content = :water
    @hit = false
    @ship_object = nil
  end

  def content
    @content
  end

  def hit?
    @hit
  end

  def hit!
    raise 'This cell has already been hit.' if hit?
    @hit = true
  end

  def ship_in_cell!(ship) 
    @content = :ship
    @ship_object = ship
  end

  def ship_in_cell?
    raise 'This cell already has a ship in it.' if ship_object != nil
  end

  def ship_object
    @ship_object
  end

end