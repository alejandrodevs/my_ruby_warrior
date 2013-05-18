module WarriorHelpers
  module Direction

    def direction_of_stairs
      warrior.direction_of_stairs
    end

    def direction_of space
      warrior.direction_of(space)
    end

    def directions
      [:forward, :backward, :right, :left]
    end

    def direction_of_ticking
      direction_of(captive_ticking?) if captive_ticking?
    end

    def direction_of_closer_object
      direction_of(closer_object) if closer_object
    end

    def direction
      direction_of_ticking ||
      direction_of_closer_object ||
      direction_of_stairs
    end

    def better_direction? direction
      feel(direction).stairs? ? empty_field? : !feel(direction).wall?
    end

    def dir
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
      inverse_direction[@previous_direction || :right]
    end

    def inverse_direction
      {
        :forward  => :backward,
        :backward => :forward,
        :left     => :right,
        :right    => :left
      }
    end

    def direction_enemy_around
      directions.detect{ |d| feel(d).enemy? && d != dir }
    end

  end
end
