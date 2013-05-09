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
      warrior.health < previous_health
    end

    def retired?
      @retired || false
    end

    def danger?
      sludges?(0) || shooter?(1) || shooter?(2)
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
      look[pos] == "Sludge"
    end

    def shooter? pos
      ["Wizard", "Archer"].include?(look[pos])
    end

    def nothing? pos
      look[pos] == "nothing"
    end

    def enemy? pos
      ["Wizard", "Archer", "Thick Sludge", "Sludge"].
        include?(look[pos])
    end

    def can_survive? pos
      if enemy?(pos)
        enemy_health[look[pos]] - (@attacks + (@to == :forward ? 5 : 3)) <= 0
      else
        false
      end
    end

    def should_retire?
      taking_damage? && dying?
    end

    def should_rest?
      retired? && !fit?
    end

    def should_shoot?
      nothing?(0) && shooter?(1) ||
      nothing?(0) && (enemy?(1) || nothing?(1)) && shooter?(2)
    end

    def enemy_health
      {
        "Wizard" => 3,
        "Archer" => 7,
        "Thick Sludge" => 25,
        "Sludge" => 12
      }
    end

  end
end
