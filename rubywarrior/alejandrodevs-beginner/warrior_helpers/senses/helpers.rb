module WarriorHelpers
  module Senses
    module Helpers

      def power
        should_shoot? ? 3 : (@to == :forward ? 5 : 3)
      end

      def damage_given
        (should_shoot? ? @shoots : @attacks).to_i
      end

    end
  end
end
