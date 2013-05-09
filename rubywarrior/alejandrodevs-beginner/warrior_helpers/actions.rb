module WarriorHelpers
  module Actions

    def attack!
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
      @retired = true
      warrior.walk!(@to == :forward ? :backward : :forward)
    end

    def shoot!
      warrior.shoot!(@to)
    end

  end
end
