module WarriorHelpers
  module Actions

    def attack!
      @attacks = enemy_will_die? ? 0 : @attacks + power
      warrior.attack!(dir)
    end

    def walk!
      @previous_direction = dir
      warrior.walk!(dir)
    end

    def rest!
      warrior.rest!
    end

    def detonate!
      warrior.detonate!(dir)
    end

    def rescue!
      warrior.rescue!(dir)
    end

    def bind!
      warrior.bind!(direction_enemy_around)
    end

    def retire!
      warrior.walk!(safe_direction)
    end

  end
end
