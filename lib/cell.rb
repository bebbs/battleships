class Cell

  def initialize 
    @content = :water
    @hit = false
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

end