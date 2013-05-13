module WarriorHelpers
  module Actions

    def attack!
      @attacks = enemy_will_die? ? 0 : @attacks + power
      warrior.attack!
    end

    def rest!
      warrior.rest!
    end

    def walk!
      @retired = false
      warrior.walk!
    end

    def rescue!
      warrior.rescue!
    end

    def pivot!
      @pivoted = true
      warrior.pivot!
    end

    def retire!
      @previous_look, @retired = look, true
      warrior.walk!(:backward)
    end

    def shoot!
      @shoots = enemy_will_die? ? 0 : @shoots + power
      warrior.shoot!
    end

  end
end
