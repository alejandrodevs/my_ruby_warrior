module WarriorHelpers
  module Senses
    module Helpers

      def power
        should_shoot? ? 3 : 5
      end

      def damage_given
        @shoots + @attacks
      end

      def clean_line
        look.select{ |e| e != "nothing" }
      end

      def dwt
        a = (next_enemy_life / power).ceil * 3
        (next_enemy_life / power.to_f) == (next_enemy_life / power) ? a - 3 : a
      end

      def test
        if retired? && !next_enemy && old_enemy
          a = (((enemies_hp[old_enemy] - damage_given) / 3) * 3) + 1
          a >= 20 ? health < 19 : a > health
        end
      end

    end
  end
end
