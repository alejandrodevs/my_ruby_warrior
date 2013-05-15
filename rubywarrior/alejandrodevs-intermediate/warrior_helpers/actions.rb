module WarriorHelpers
  module Actions

    def attack!
      warrior.attack!(enemy_direction || :forward)
    end

    def walk!
      warrior.walk!(direction_of_stairs)
    end

    def rest!
      warrior.rest!
    end

  end
end
