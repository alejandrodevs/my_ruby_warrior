module WarriorHelpers
  module Senses
    module Battlefield

      def nothing? pos
        look[pos] == "nothing"
      end

      def there_wall?
        look.include? "wall"
      end

      def there_captives? to = :forward
        look(to).include?("Captive")
      end

      def there_enemies?
        !enemies.empty?
      end

      def only_wall?
        there_wall? && !there_stairs? && !there_enemies? && !there_captives?
      end

      def there_stairs?
        warrior.look.select{ |e| e.stairs? }.count > 0
      end

      def there_archers? to = :forward
        look(to).select{|e| e == "Archer"}.count > 0
      end

    end
  end
end
