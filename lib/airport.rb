class Airport
  attr_reader :capacity, :planes
  def initialize(capacity = 50)
    @capacity = capacity
    @planes = []
  end

  def conditions(cheat = nil)
    random = (rand(10) > 2 ? 'clear' : 'raining')
    @conditions = (!cheat.nil? ? cheat : random)
  end

  def land(plane)
    if @conditions == 'clear' && @planes.length < @capacity
      plane.land
      @planes << plane
    elsif @capacity <= @planes.length
      fail 'Authorisation denied. The airport is full!'
    else
      fail 'Authorisation denied. Its raining!'
    end
  end

  def take_off(plane)
    if @conditions == 'clear' && @planes.include?(plane)
      plane.take_off
      @planes.delete(plane)
    elsif @conditions == 'clear'
      fail 'This plane is not in this airport!'
    else
      fail 'Authorisation denied. Its raining!'
    end
  end
end