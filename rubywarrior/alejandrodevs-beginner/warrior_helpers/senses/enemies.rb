module WarriorHelpers
  module Senses
    module Enemies

      ENEMIES = ["Wizard", "Archer", "Thick Sludge", "Sludge"]

      def sludges? pos
        thick_sludge?(pos) || small_sludge?(pos)
      end

      def thick_sludge? pos
        look[pos] == "Thick Sludge"
      end

      def small_sludge? pos
        look[pos] == "Sludge"
      end

      def shooter? pos
        ["Wizard", "Archer"].include?(look[pos])
      end

      def archer? pos
        look[pos] == "Archer"
      end

      def wizard? pos
        look[pos] == "Wizard"
      end

      def enemies_hp
        {"Wizard" => 3, "Archer" => 7, "Thick Sludge" => 24, "Sludge" => 12}
      end

      def enemy? pos
        ENEMIES.include?(look[pos])
      end

      def enemies to = @to
        look(to).select{ |e| ENEMIES.include? e }
      end

      def next_enemy
        enemies.first
      end

      def next_enemy_life
        enemies_hp[next_enemy] - damage_given
      end

      def enemy_will_die?
        next_enemy_life - power <= 0
      end

      def can_kill_it?
        next_enemy ? (next_enemy_life - power <= 0) : true
      end

    end
  end
end
