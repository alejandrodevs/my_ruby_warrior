module WarriorHelpers
  module Actions

    def attack!
      if (enemy_health[next_enemy] - (@attacks.to_i + (@to == :forward ? 5 : 3))) <= 0
        @attacks = 0
      else
        @attacks += (@to == :forward ? 5 : 3)
      end
      warrior.attack!(@to)
    end

    def rest!
      @retired = false
      warrior.rest!
    end

    def walk!
      @attacks = 0
      warrior.walk!(@to)
    end

    def rescue!
      warrior.rescue!(@to)
    end

    def pivot!
      warrior.pivot!(@to)
    end

    def retire!
      @retired = true
      warrior.walk!(@to == :forward ? :backward : :forward)
    end

    def shoot!
      if (enemy_health[next_enemy] - (@shoots.to_i + 3)) <= 0
        @shoots = 0
      else
        @shoots += 3
      end
      warrior.shoot!(@to)
    end

  end
end
