module WarriorHelpers
  module Health

    def health
      warrior.health
    end

    def previous_health
      @previous_health || health
    end

    def dying?
      health < 3
    end

    def health_necessary?
      damage_will_take < 20 ? damage_will_take < health : health > 19
    end

    def need_more_health?
      !can_kill_it? && !health_necessary?
    end

  end
end
