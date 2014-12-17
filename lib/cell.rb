class Cell

  def initialize 
    @content = :water
    @hit = false
    @ship_object = nil
  end

  def content # remove
    @content
  end

  def hit? # attr_reader
    @hit
  end

  def ship_object # attr_reader
    @ship_object
  end



  def hit!
    raise 'This cell has already been hit.' if hit?
    @hit = true
  end

  def ship_in_cell!(ship) 
    @content = :ship # can remove
    @ship_object = ship
  end

  def ship_in_cell?
    raise 'This cell already has a ship in it.' if ship_object != nil
  end
  
  def ship_or_water
    ship_object != nil ? :ship : :water
  end

end