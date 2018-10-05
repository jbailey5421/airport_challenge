require_relative 'plane'
class Airport
    attr_reader :tarmac
    def initialise
        @tarmac = {}
    end
    
    def land(plane)
       @tarmac << plane
    end
    def takeoff(plane)
        
    end

end