module WarriorHelpers
  module Health

    def previous_health
      @previous_health || warrior.health
    end

    def dying?
      warrior.health < 3
    end

    def health_necessary?
      if next_enemy then dwt >= 20 ? health >= 19 : dwt < health
      elsif there_wall? then true end
    end

  end
end
