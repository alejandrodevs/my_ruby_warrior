module WarriorHelpers
  module Course

    def to
      @to ||= warrior.feel(:backward).wall? ? :forward : :backward
    end

  end
end
