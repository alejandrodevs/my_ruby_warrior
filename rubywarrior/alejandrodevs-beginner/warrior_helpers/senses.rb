module WarriorHelpers
  module Senses

    def feel
      warrior.feel(to)
    end

    def health
      warrior.health
    end

    def look
      warrior.look(to)
    end

    def taking_damage?
      warrior.health < prev_health
    end

    def retired?
      @retired || false
    end

    def danger?
      dangerous_item?(items_in_sight.first)
    end

    def safe?
      !danger?
    end

    def items_in_sight
      look.select{|o| o.to_s != "nothing"}.map(&:to_s)
    end

    def dangerous_item? obj
      ["Wizard", "Archer"].include?(obj)
    end

  end
end
