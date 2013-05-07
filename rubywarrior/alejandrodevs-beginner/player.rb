class Player

  def play_turn(warrior)
    # Extends warrior instance with WarriorHelpers methods.
    warrior.instance_eval do
      extend ::WarriorHelpers
    end

    # Defines ancestor method to warrior instance and return @warrior
    # instance_variable in this Player class.
    ancestor = @warrior || warrior
    warrior.define_singleton_method(:ancestor) do
      ancestor
    end

    # Warrior's turn code.
    warrior.play!

    # Defines the ancestor to the next turn.
    @warrior = warrior
  end

end

require 'warrior_helpers.rb'
