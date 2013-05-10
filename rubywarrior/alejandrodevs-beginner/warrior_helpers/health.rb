module WarriorHelpers
  module Health

    def previous_health
      @previous_health || warrior.health
    end

    def dying?
      warrior.health < 3
    end

    def fit?
      warrior.health > 12
    end

  end
end
