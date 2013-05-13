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
      dying? && !can_kill_it? && danger?
    end

    #--------------------------------------------------------------
    # TESTS
    #--------------------------------------------------------------

    def test
      if retired? && !next_enemy && old_enemy
        a = (((enemies_hp[old_enemy] - damage_given) / 3) * 3) + 1
        a >= 20 ? health < 19 : a > health
      else
        false
      end
    end

    def old_enemy
      Array(@previous_look).select{|e| ENEMIES.include? e }.first
    end

    def should_rest?
      !enemy?(0) && (!health_necessary? && !can_kill_it?) || test
    end

    #--------------------------------------------------------------

    def there_wall?
      look.include? "wall"
    end

    def enemies to = @to
      look(to).select{ |e| ENEMIES.include? e }
    end

    def next_enemy
      enemies.first
    end

    def first_item to = @to
      i = -1
      [look(to).detect{ |e| i += 1; e != "nothing" }, i]
    end

    def should_shoot?
      nothing?(0) && (wizard?(1) || (nothing?(1) && shooter?(2)))
    end

    def should_walk?
      feel.empty? && !should_shoot?
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
      a = (next_enemy_life / power).ceil * 3
      (next_enemy_life / power.to_f) == (next_enemy_life / power) ? a - 3 : a
    end

    def health_necessary?
      if next_enemy then dwt >= 20 ? health >= 19 : dwt < health
      elsif there_wall? then true
      end
    end

    def enemy_will_die?
      next_enemy_life - power <= 0
    end

    def only_wall?
      a = look(@to || :backward).select{ |e| e != "nothing" }.uniq
      a.length == 1 && a[0] == "wall"
    end

  end
end
