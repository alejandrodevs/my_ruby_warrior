module WarriorHelpers
  module Health

    def previous_health
      @previous_health || warrior.health
    end

    def dying?
      warrior.health < 3
    end

  end
end
