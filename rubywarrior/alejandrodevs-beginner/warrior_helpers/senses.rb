module WarriorHelpers
  module Senses

    ENEMIES = ["Wizard", "Archer", "Thick Sludge", "Sludge"]

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
      ENEMIES.include?(look[pos])
    end

    def power
      should_shoot? ? 3 : (@to == :forward ? 5 : 3)
    end

    def should_retire?
      taking_damage? && dying? && !can_kill_it?
    end

    def should_rest?
      retired? || (!health_necessary? && !can_kill_it?)
    end

    def empty_line?
      look.uniq == 1 && look[0] == "nothing"
    end

    def there_wall?
      look.include? "wall"
    end

    def next_enemy
      look.select{ |e| ENEMIES.include? e }.first
    end

    def should_shoot?
      nothing?(0) && (wizard?(1) || (nothing?(1) && shooter?(2)))
    end

    def next_enemy_life
      enemies_hp[next_enemy] - damage_given
    end

    def damage_given
      (should_shoot? ? @shoots : @attacks).to_i
    end

    def enemies_hp
      {"Wizard" => 3, "Archer" => 7, "Thick Sludge" => 24, "Sludge" => 12}
    end

    def can_kill_it?
      next_enemy ? (next_enemy_life - power <= 0) : true
    end

    def dwt
      (next_enemy_life / power).ceil * 3
    end

    def health_necessary?
      if next_enemy then dwt >= 20 ? health >= 19 : dwt < health
      elsif there_wall? then true
      else health > 3
      end
    end

  end
end
