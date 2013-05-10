module WarriorHelpers
  module Course

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
        @to ||= :backward
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
