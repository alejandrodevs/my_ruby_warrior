module WarriorHelpers
  module Course

    def set_direction
      if warrior.feel(:backward).wall?
        @wall_back = true
        @to = :forward
      elsif warrior.feel(:forward).wall?
        @to = :backward
      else
        if only_wall?(@to || :forward)
          @to = inverse
        else
          @to ||= :forward
        end
      end
    end

    def inverse
      (@to || :forward) == :forward ? :backward : :forward
    end

    def only_wall? pos
      units = look(pos).select{ |e| e != "nothing" }.uniq
      units.length == 1 && units.include?("wall") && @to == :forward && !@wall_back
    end

  end
end
