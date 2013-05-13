module WarriorHelpers
  module Direction

    def direction
      if warrior.feel(:backward).wall?
        @wall_backward = true
        :forward
      elsif warrior.feel(:forward).wall?
        @wall_forward = true
        :backward
      elsif only_wall? && !@wall
        @wall = true
        inverse
      else
        @to || initial_direction
      end
    end

    def initial_direction
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
      if (@to || initial_direction) == :forward
        @wall_backward ? :forward : :backward
      else
        @wall_forward ? :backward : :forward
      end
    end

    def only_wall?
      a = look(@to || :backward).select{ |e| e != "nothing" }.uniq
      a.length == 1 && a[0] == "wall"
    end

    def inverse_direction
      @to == :forward ? :backward : :forward
    end

  end
end
