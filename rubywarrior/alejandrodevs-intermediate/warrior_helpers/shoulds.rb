module WarriorHelpers
  module Shoulds

    def should_retire?
      !safe? && dying? && !can_kill_it?
    end

    def should_rest?
      safe? && there_enemy? && !can_kill_it? && !health_necessary?
    end

    def should_walk?
      #safe? && empty_around?
      true
    end

    def should_attack?
      feel(optimal_direction).enemy?
    end

    def should_bind?
      enemies_around > 1
    end

    def should_rescue?
      feel(optimal_direction).captive?
    end

  end
end
