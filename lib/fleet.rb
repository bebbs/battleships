class Fleet

  attr_reader :ship_array, :ship_status_array

  def initialize
    @ship_array = []
    create_ships
  end

  def create_ships
    @ship_array << Ship.aircraft_carrier
    @ship_array << Ship.battleship
    2.times {@ship_array << Ship.destroyer}
    @ship_array << Ship.submarine
    4.times {@ship_array << Ship.patrol_boat}
  end

  def ship_status
    @ship_status_array = []
    ship_array.each do |ship|
      @ship_status_array << ship.sunk?
    end
  end

  def sunk?
    ship_status
    ship_status_array.all? {|status| status == true }
  end

end