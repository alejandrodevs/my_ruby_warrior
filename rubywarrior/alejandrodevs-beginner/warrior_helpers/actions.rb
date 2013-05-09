module WarriorHelpers
  module Actions

    def attack!
      @attacks += (@to == :forward ? 5 : 3)
      warrior.attack!(@to)
    end

    def rest!
      warrior.rest!
    end

    def walk!
      @retired = false
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
      warrior.shoot!(@to)
    end

  end
end
