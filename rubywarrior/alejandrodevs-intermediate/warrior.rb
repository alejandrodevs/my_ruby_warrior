require 'warrior_helpers'

class Warrior
  include ::WarriorHelpers

  attr_accessor :warrior

  def prepare warrior
    @warrior = warrior
  end

  def play!
    if    should_rest?   then rest!
    elsif should_walk?   then walk!
    elsif should_bind?   then bind!
    elsif should_attack? then attack!
    elsif should_rescue? then rescue!
    end
  end

  def set_memories
    @previous_health = warrior.health
  end

end
