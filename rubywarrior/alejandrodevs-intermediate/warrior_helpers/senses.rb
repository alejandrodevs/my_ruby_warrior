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
      safe? && empty_around?
    end

    def should_attack?
      !safe?
    end

    def should_bind?
      enemies_amount > 1
    end

    def should_rescue?
      there_captives?
    end

    def empty_around?
      directions.select{ |d| !feel(d).enemy? && !feel(d).captive? }.count == 4
    end

    def directions
      [:forward, :backward, :right, :left]
    end

    def enemies_amount
      directions.select{ |d| feel(d).enemy? }.count
    end

    def enemy_direction
      directions.detect{ |d| feel(d).enemy? }
    end

    def captive_direction
      directions.detect{ |d| feel(d).captive? }
    end

    def there_captives?
      directions.select{ |d| feel(d).captive? }.count > 0
    end

    def safe?
      directions.select{ |d| feel(d).enemy? }.count == 0
    end

  end
end
