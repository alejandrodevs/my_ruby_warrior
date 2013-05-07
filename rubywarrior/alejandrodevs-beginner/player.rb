class Player

  def play_turn(warrior)
    warrior.instance_eval do
      extend ::WarriorHelpers
    end

    warrior.play!
  end

end

require 'warrior_helpers.rb'
