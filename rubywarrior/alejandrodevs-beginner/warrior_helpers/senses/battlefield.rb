module WarriorHelpers
  module Senses
    module Battlefield

      def nothing? pos
        look[pos] == "nothing"
      end

      def there_wall?
        look.include? "wall"
      end

      def there_captive? to
        look(to).include?("Captive")
      end

      def only_wall?
        clean_line.uniq.length == 1 && clean_line[0] == "wall" && !feel.stairs?
      end

    end
  end
end
