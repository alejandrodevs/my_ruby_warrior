module WarriorHelpers
  module Senses

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
      warrior.health < prev_health
    end

    def retired?
      @retired || false
    end

    def danger?
      sludges?(0) || shooters?(1) || shooters?(2)
    end

    def safe?
      !danger?
    end

    def sludges? pos
      thick_sludge?(pos) || small_sludge?(pos)
    end

    def thick_sludge? pos
      look[pos] == "Thick Sludge"
    end

    def small_sludge? pos
      look[pos] == "Small Sludge"
    end

    def shooters? pos
      ["Wizard", "Archer"].include?(look[pos])
    end

  end
end
