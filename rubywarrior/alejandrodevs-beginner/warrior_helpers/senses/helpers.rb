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
        danger? ? ((next_enemy_life / power.to_f) - 1).ceil * 3 : 0
      end

    end
  end
end
