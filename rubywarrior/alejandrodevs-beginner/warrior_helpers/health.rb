module WarriorHelpers
  module Health

    def prev_health
      @prev_health || warrior.health
    end

    def dying?
      warrior.health < 3
    end

    def fit?
      warrior.health > 10
    end

  end
end
