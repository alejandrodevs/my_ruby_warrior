module WarriorHelpers
  module Senses

    def feel to
      warrior.feel(to || :forward)
    end

    def empty_around?
      directions.select{ |d| feel(d).captive? || feel(d).enemy? }.count == 0
    end

    def empty_field?
      listen.select{ |s| s.enemy? || s.captive? }.count == 0
    end

    def enemies_around
      directions.select{ |d| feel(d).enemy? }.count
    end

    def there_captive?
      space_ticking? || listen.detect{ |s| s.captive? }
    end

    def there_enemy?
      listen.detect{ |s| s.enemy? }
    end

    def space_ticking?
      listen.detect{ |s| s.ticking? }
    end

    def safe?
      directions.select{ |d| feel(d).enemy? }.count == 0
    end

    def listen
      warrior.listen
    end

    def power
      direction_of_enemy == :backward ? 3 : 5
    end

    def enemies_hp
      {"Wizard" => 3, "Archer" => 7, "Thick Sludge" => 24, "Sludge" => 12}
    end

    def next_enemy
      there_enemy? ? there_enemy?.to_s : nil
    end

    def next_enemy_life
      enemies_hp[next_enemy] - @attacks
    end

    def enemy_will_die?
      next_enemy_life - power <= 0
    end

    def can_kill_it?
      next_enemy ? enemy_will_die? : true
    end

    def health_necessary?
      dwt >= 20 ? health >= 19 : dwt < health
    end

    def dwt
      !safe? ? ((next_enemy_life / power.to_f) - 1).ceil * 3 : 0
    end

  end
end
