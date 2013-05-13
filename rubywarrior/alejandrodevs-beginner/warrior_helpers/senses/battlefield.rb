module WarriorHelpers
  module Senses
    module Battlefield

      def nothing? pos
        look[pos] == "nothing"
      end

      def there_wall?
        look.include? "wall"
      end

      def only_wall?
        clean_line.uniq.length == 1 && clean_line[0] == "wall"
      end

    end
  end
end
