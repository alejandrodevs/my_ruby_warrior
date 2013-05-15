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

    def rescue!
      warrior.rescue!(captive_direction)
    end

    def bind!
      warrior.bind!(enemy_direction)
    end

  end
end
