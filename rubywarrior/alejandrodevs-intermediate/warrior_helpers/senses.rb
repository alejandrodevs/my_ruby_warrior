module WarriorHelpers
  module Senses

    def feel to
      warrior.feel(to || :forward)
    end

    def health
      warrior.health
    end

    def direction_of_stairs
      warrior.direction_of_stairs
    end

    def should_rest?
      !in_shape? && safe?
    end

    def should_walk?
      safe?
    end

    def should_attack?
      !safe?
    end

    def directions
      [:forward, :backward, :right, :left]
    end

    def enemy_direction
      directions.detect{ |d| feel(d).enemy? }
    end

    def safe?
      directions.select{ |d| feel(d).enemy? }.count == 0
    end

  end
end
