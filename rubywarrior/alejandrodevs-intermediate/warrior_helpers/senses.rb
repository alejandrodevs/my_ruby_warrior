module WarriorHelpers
  module Senses

    def feel to
      warrior.feel(to || :forward)
    end

    def empty_around?
      directions.select{ |d| !feel(d).enemy? && !feel(d).captive? }.count == 4
    end

    def enemies_amount
      directions.select{ |d| feel(d).enemy? }.count
    end

    def there_captives?
      directions.select{ |d| feel(d).captive? }.count > 0
    end

    def safe?
      directions.select{ |d| feel(d).enemy? }.count == 0
    end

  end
end
