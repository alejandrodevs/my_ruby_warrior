module WarriorHelpers
  module Senses
    module Shoulds

      def should_retire?
        dying? && !can_kill_it? && danger?
      end

      def should_rest?
        !enemy?(0) && (!health_necessary? && !can_kill_it?) || test
      end

      def should_shoot?
        nothing?(0) && (wizard?(1) || (nothing?(1) && shooter?(2)))
      end

      def should_walk?
        feel.empty? && !should_shoot?
      end

      def should_attack?
        feel.enemy?
      end

      def should_rescue?
        feel.captive?
      end

    end
  end
end
