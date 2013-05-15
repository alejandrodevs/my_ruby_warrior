module WarriorHelpers
  module Actions

    def attack!
      @attacks = enemy_will_die? ? 0 : @attacks + power
      warrior.attack!(direction_of_enemy)
    end

    def walk!
      @previous_direction = optimal_direction
      warrior.walk!(optimal_direction)
    end

    def rest!
      warrior.rest!
    end

    def rescue!
      warrior.rescue!(direction_of_captive)
    end

    def bind!
      warrior.bind!(direction_of_enemy)
    end

    def retire!
      warrior.walk!(safe_direction)
    end

  end
end
