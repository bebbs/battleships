class Fleet

  def initialize
    @ship_array = []
    create_ships
  end

  def create_ships
    @ship_array << Ship.new(:aircraft_carrier)
    @ship_array << Ship.new(:battleship)
    2.times {@ship_array << Ship.new(:destroyer)}
    @ship_array << Ship.new(:submarine)
    4.times {@ship_array << Ship.new(:patrol_boat)}
  end

  def ship_array
    @ship_array
  end

  def ship_status_array
    @ship_status_array
  end

  def ship_status
    @ship_status_array = []
    @ship_array.each do |ship|
      @ship_status_array << ship.sunk?
    end
  end

  def sunk?
    ship_status_array.all? {|status| status == true }
  end

end