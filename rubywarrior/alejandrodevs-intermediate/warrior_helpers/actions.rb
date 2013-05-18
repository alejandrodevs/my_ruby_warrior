module WarriorHelpers
  module Actions

    def attack!
      @attacks = enemy_will_die? ? 0 : @attacks + power
      warrior.attack!(optimal_direction)
    end

    def walk!
      @previous_direction = optimal_direction
      warrior.walk!(optimal_direction)
    end

    def rest!
      warrior.rest!
    end

    def rescue!
      warrior.rescue!(optimal_direction)
    end

    def bind!
      warrior.bind!(direction_of_enemy)
    end

    def retire!
      warrior.walk!(safe_direction)
    end

  end
end
