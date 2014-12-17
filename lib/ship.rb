class Ship

  #SHIPS = {aircraft_carrier: 5, battleship: 4, submarine: 3, destroyer: 3, patrol_boat: 2}

  def initialize(type)
    @size = ship_size(type)
    @type = type
    @hits_received = 0
  end

  def ship_size(type)
    case type
      when :aircraft_carrier then 5
      when :battleship then 4
      when :submarine then 3
      when :destroyer then 3
      when :patrol_boat then 2
      else raise 'Ship type not recognised!'
    end
  end

  # def self.method_missing
  #   new SHIPS[name] if SHIPS[name]
  #   super
  # end

  def size?
    @size
  end

  def type?
    @type
  end

  def hits_received?
    @hits_received
  end

  def hit!
    @hits_received += 1
  end

  def sunk?
    hits_received? == size?
  end

end