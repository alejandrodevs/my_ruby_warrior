module WarriorHelpers
  module Direction

    def direction_of_stairs
      warrior.direction_of_stairs
    end

    def directions
      [:forward, :backward, :right, :left]
    end

    def enemy_direction
      directions.detect{ |d| feel(d).enemy? }
    end

    def captive_direction
      directions.detect{ |d| feel(d).captive? }
    end

  end
end
