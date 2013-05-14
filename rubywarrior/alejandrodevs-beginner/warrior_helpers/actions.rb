module WarriorHelpers
  module Actions

    def attack!
      @attacks = enemy_will_die? ? 0 : @attacks + power
      @shoots  = 0 if @attacks == 0
      warrior.attack!
    end

    def rest!
      warrior.rest!
    end

    def walk!
      warrior.walk!
    end

    def rescue!
      warrior.rescue!
    end

    def pivot!
      warrior.pivot!
    end

    def retire!
      warrior.walk!(:backward)
    end

    def shoot!
      @shoots  = enemy_will_die? ? 0 : @shoots + power
      @attacks = 0 if @shoots == 0
      warrior.shoot!
    end

  end
end
