module WarriorHelpers
  module Actions

    def attack!
      @attacks = next_enemy_life - power <= 0 ? 0 : @attacks + power
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

    def pivot!
      warrior.pivot!(@to)
    end

    def retire!
      @previous_look, @retired = look, true
      warrior.walk!(@to == :forward ? :backward : :forward)
    end

    def shoot!
      @shoots = next_enemy_life - power <= 0 ? 0 : @shoots + power
      warrior.shoot!(@to)
    end

  end
end
