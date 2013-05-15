module WarriorHelpers
  module Direction

    def direction_of_stairs
      warrior.direction_of_stairs
    end

    def directions
      [:forward, :backward, :right, :left]
    end

    def direction_of_captive
      direction_of(there_captive?) if there_captive?
    end

    def direction_of_enemy
      direction_of(there_enemy?) if there_enemy?
    end

    def direction
      direction_of_captive || direction_of_enemy || direction_of_stairs
    end

    def better_direction? direction
      feel(direction).stairs? ? empty_field? : !feel(direction).wall?
    end

    def optimal_direction
      better_direction?(direction) ? direction : alternative_direction
    end

    def alternative_direction
      alternative_directions[direction].detect{ |d| better_direction?(d) }
    end

    def alternative_directions
      {
        :forward  => [:right, :left],
        :backward => [:right, :left],
        :left     => [:forward, :backward],
        :right    => [:forward, :backward]
      }
    end

    def safe_direction
      inverse_direction[@previous_direction]
    end

    def inverse_direction
      {
        :forward  => :backward,
        :backward => :forward,
        :left     => :right,
        :right    => :left
      }
    end

    def direction_of space
      warrior.direction_of(space)
    end

  end
end
