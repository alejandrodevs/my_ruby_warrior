module WarriorHelpers
  module Health

    def prev_health
      @prev_health || warrior.health
    end

    def dying?
      warrior.health < 4
    end

    def fit?
      warrior.health > 15
    end

  end
end
