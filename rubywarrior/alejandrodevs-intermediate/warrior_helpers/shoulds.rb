module WarriorHelpers
  module Shoulds

    def should_retire?
      !safe? && dying? && !can_kill_it?
    end

    def should_rest?
      safe? && enemy? && need_more_health?
    end

    def should_bind?
      surrounded?
    end

    def should_detonate?
      enemies_mob? && feel(dir).enemy?
    end

    def should_attack?
      feel(dir).enemy? || captive_liar?
    end

    def should_rescue?
      feel(dir).captive?
    end

    def should_walk?
      feel(dir).empty?
    end

  end
end
