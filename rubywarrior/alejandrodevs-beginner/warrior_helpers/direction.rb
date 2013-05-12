module WarriorHelpers
  module Direction

    def set_direction
      if warrior.feel(:backward).wall?
        @wall_back = !@wall_back
        :forward
      elsif warrior.feel(:forward).wall?
        @wall_front = !@wall_front
        :backward
      elsif only_wall? && !@only_wall
        @only_wall = true
        @to = inverse
      else
        @to ||= test_to
      end
    end

    def test_to
      b = first_item(:backward)
      f = first_item(:forward)
      if b.first
        if f.first
          if b.last < f.last
            f.first == "Captive" ? :forward : :backward
          else
            b.first == "Captive" ? :backward : :forward
          end
        else
          :backward
        end
      else
        f.first ? :forward : :backward
      end
    end

    def inverse
      if (@to || :forward) == :forward
        @wall_back == true ? :forward : :backward
      else
        @wall_front == true ? :backward : :forward
      end
    end

    def only_wall?
      a = look(@to || :backward).select{ |e| e != "nothing" }.uniq
      a.length == 1 && a[0] == "wall"
    end

  end
end
