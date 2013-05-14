module WarriorHelpers
  module Senses
    module Helpers

      def power
        should_shoot? ? 3 : 5
      end

      def damage_given
        @shoots + @attacks
      end

      def dwt
        if nothing?(0) && (sludges?(1) || (nothing?(1) && sludges?(2)))
          0
        else
          a = (next_enemy_life / power).ceil * 3
          (next_enemy_life / power.to_f) == (next_enemy_life / power) ? a - 3 : a
        end
      end

    end
  end
end
