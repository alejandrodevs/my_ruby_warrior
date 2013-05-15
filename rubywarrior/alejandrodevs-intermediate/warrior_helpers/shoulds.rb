module WarriorHelpers
  module Shoulds

    def should_retire?
      !safe? && dying? && !can_kill_it?
    end

    def should_rest?
      !in_shape? && safe? && there_enemy?
    end

    def should_walk?
      safe? && empty_around?
    end

    def should_attack?
      feel(optimal_direction).enemy?
    end

    def should_bind?
      enemies_around > 1
    end

    def should_rescue?
      there_captive? && feel(direction_of_captive).captive?
    end

  end
end
