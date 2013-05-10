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

    def archer? pos
      look[pos] == "Archer"
    end

    def wizard? pos
      look[pos] == "Wizard"
    end

    def nothing? pos
      look[pos] == "nothing"
    end

    def enemy? pos
      ["Wizard", "Archer", "Thick Sludge", "Sludge"].
        include?(look[pos])
    end

    def can_survive?
      if enemy?(0)
        enemy_health[look[0]] - (@attacks + (@to == :forward ? 5 : 3)) <= 0
      elsif enemy?(1)
        enemy_health[look[1]] - (@attacks + (@to == :forward ? 5 : 3)) <= 0
      elsif enemy?(2)
        enemy_health[look[2]] - (@attacks + (@to == :forward ? 5 : 3)) <= 0
      end
    end

    def should_retire?
      taking_damage? && dying? && !can_survive?
    end

    def health_necessary?
      if next_enemy
        ((next_enemy_life / (@to == :forward ? 5 : 3)).ceil * 3) < health
      else
        true
      end
    end

    def should_rest?
      retired? || !health_necessary?
    end

    def should_shoot?
      ((nothing?(0) && wizard?(1)) ||
      (nothing?(0) && nothing?(1) && shooter?(2))
    end

    ENEMIES = ["Wizard", "Archer", "Thick Sludge", "Sludge"]

    def next_enemy
      look.select{ |e| ENEMIES.include? e }.first
    end

    def next_enemy_life
      if should_shoot?
        enemy_health[next_enemy] - @shoots.to_i
      else
        enemy_health[next_enemy] - @attacks.to_i
      end
    end

    def enemy_health
      {
        "Wizard" => 3,
        "Archer" => 7,
        "Thick Sludge" => 24,
        "Sludge" => 12
      }
    end

  end
end
