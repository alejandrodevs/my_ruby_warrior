module WarriorHelpers
  module Senses
    module Basics

      def feel
        warrior.feel(@to)
      end

      def health
        warrior.health
      end

      def look to = @to
        warrior.look(to).map(&:to_s)
      end

      def taking_damage?
        health < previous_health
      end

      def retired?
        @retired || false
      end

      def danger?
        sludges?(0) || shooter?(1) || shooter?(2)
      end

    end
  end
end
