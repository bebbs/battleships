class Ship
  def initialize(type)
    @size = ship_size(type)
  end

  def ship_size(type)
    case type
      when :aircraft_carrier then 5
      when :battleship then 4
      when :submarine then 3
      when :destroyer then 3
      when :patrol_boat then 2
      else raise "Ship type not recognized!"
    end
  end

  def size?
    @size
  end

end