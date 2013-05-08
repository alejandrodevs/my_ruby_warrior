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
      danger_object?(path_objects.first)
    end

    def safe?
      !danger?
    end

    def path_objects
      look.select{|o| o.to_s != "nothing"}.map(&:to_s)
    end

    def danger_object? obj
      ["Wizard", "Archer"].include?(obj)
    end

  end
end
