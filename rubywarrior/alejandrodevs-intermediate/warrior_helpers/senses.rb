module WarriorHelpers
  module Senses

    ENEMIES = ["Thick Sludge", "Sludge"]

    def safe?
      enemies_around == 0
    end

    def enemies_around
      directions.select{ |d| feel(d).enemy? }.count
    end

    def enemies
      listen.select{ |s| ENEMIES.include?(s.to_s) }
    end

    def captives
      listen.select{ |s| s.captive? }
    end

    def empty_field?
      enemies.count + captives.count == 0
    end

    def captive?
      captive_ticking? || captives.first
    end

    def enemy?
      enemies.first
    end

    def captive_ticking?
      listen.detect{ |s| s.ticking? }
    end

    def power
      dir == :backward ? 3 : 5
    end

    def enemies_hp
      {"Thick Sludge" => 24, "Sludge" => 12}
    end

    def enemy_health
      enemies_hp[closer_enemy.to_s] - @attacks
    end

    def enemy_will_die?
      enemy? ? enemy_health - power <= 0 : nil
    end

    def can_kill_it?
      enemy? ? enemy_will_die? : true
    end

    def damage_will_take
      ((enemy_health / power.to_f) - 1).ceil * 3
    end

    def surrounded?
      enemies_around >= 2
    end

    def enemies_mob?
      look(dir).select{ |s| s.enemy? }.count >= 2
    end

    def distances
      (enemies + captives).map{ |s| distance_of(s) }
    end

    def closer_object
      (enemies + captives).detect{ |s| distance_of(s) == distances.min}
    end

    def enemies_distances
      enemies.map{ |s| distance_of(s) }
    end

    def closer_enemy
      enemies.detect{ |s| distance_of(s) == enemies_distances.min}
    end

    def captive_liar?
      feel(dir).captive? && ENEMIES.include?(feel(dir).to_s)
    end

  end
end
