class Cell

  attr_reader :hit, :ship_object

  def initialize 
    @hit = false
    @ship_object = nil
  end

  def hit!
    raise 'This cell has already been hit.' if hit
    @hit = true
  end

  def ship_in_cell!(ship) 
    @ship_object = ship
  end

  def ship_in_cell
    ship_object != nil
  end
  
  def ship_or_water
    ship_object != nil ? :ship : :water
  end

end