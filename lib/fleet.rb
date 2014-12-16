class Fleet

  def initialize  
    @dock = []
    dock_ship(Ship.new(:aircraft_carrier))
    dock_ship(Ship.new(:battleship))
    2.times {dock_ship(Ship.new(:destroyer))}
    dock_ship(Ship.new(:submarine))
    4.times {dock_ship(Ship.new(:patrol_boat))}
  end


  def dock
    @dock
  end

  def dock_ship(ship)
    dock << ship
  end

end