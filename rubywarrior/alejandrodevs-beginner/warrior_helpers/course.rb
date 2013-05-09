module WarriorHelpers
  module Course

    def set_direction
      if warrior.feel(:backward).wall?
        @wall_back = !@wall_back
        :forward
      elsif warrior.feel(:forward).wall?
        @wall_front = !@wall_front
        :backward
      elsif wall?(@to || :forward)
        @to = inverse
      else
        @to ||= :forward
      end
    end

    def inverse
      if (@to || :forward) == :forward
        @wall_back == true ? :forward : :backward
      else
        @wall_front == true ? :backward : :forward
      end
    end

    def wall? pos
      look(pos)[0] == "wall"
    end

  end
end
