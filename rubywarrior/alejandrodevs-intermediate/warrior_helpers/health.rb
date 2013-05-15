module WarriorHelpers
  module Health

    def previous_health
      @previous_health || health
    end

    def dying?
      health < 3
    end

    def in_shape?
      health >= 14
    end

  end
end
