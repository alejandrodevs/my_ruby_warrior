module WarriorHelpers
  module Actions

    def attack!
      @attacks = enemy_will_die? ? 0 : @attacks + power
      warrior.attack!(@to)
    end

    def rest!
      warrior.rest!
    end

    def walk!
      @retired = false
      warrior.walk!(@to)
    end

    def rescue!
      warrior.rescue!(@to)
    end

    def retire!
      @previous_look, @retired = look, true
      warrior.walk!(inverse_direction)
    end

    def shoot!
      @shoots = enemy_will_die? ? 0 : @shoots + power
      warrior.shoot!(@to)
    end

  end
end
