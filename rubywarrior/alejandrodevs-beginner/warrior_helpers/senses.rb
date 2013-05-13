Dir[File.dirname(__FILE__) + '/senses/*.rb'].each{ |file| require file }

module WarriorHelpers
  module Senses
    include Basics
    include Shoulds
    include Enemies
    include Helpers

    def nothing? pos
      look[pos] == "nothing"
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

    #--------------------------------------------------------------

    def there_wall?
      look.include? "wall"
    end

    def first_item to = @to
      i = -1
      [look(to).detect{ |e| i += 1; e != "nothing" }, i]
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

    def only_wall?
      a = look(@to || :backward).select{ |e| e != "nothing" }.uniq
      a.length == 1 && a[0] == "wall"
    end

  end
end
