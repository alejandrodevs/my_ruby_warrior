module WarriorHelpers
  module Senses
    module Battlefield

      def nothing? pos
        look[pos] == "nothing"
      end

      def there_wall?
        look.include? "wall"
      end

    end
  end
end
