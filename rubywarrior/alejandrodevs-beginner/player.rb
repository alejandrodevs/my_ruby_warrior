class Player

  def play_turn(warrior)
    # Defines ancestor method to warrior instance.
    ancestor = @warrior || warrior
    warrior.define_singleton_method(:ancestor){ ancestor }

    # Extends warrior instance with WarriorHelpers methods.
    warrior.extend ::WarriorHelpers

    # Warrior's turn code.
    warrior.play!

    # Defines the ancestor to the next turn.
    @warrior = warrior
  end

end

require 'warrior_helpers'
