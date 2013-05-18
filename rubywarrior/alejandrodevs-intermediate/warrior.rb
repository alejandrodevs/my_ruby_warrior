require 'warrior_helpers'

class Warrior
  include ::WarriorHelpers

  attr_accessor :warrior

  def initialize
    @attacks = 0
    @enemies_binded = []
  end

  def prepare warrior
    @warrior = warrior
  end

  def play!
    if    should_retire?   then retire!
    elsif should_rest?     then rest!
    elsif should_bind?     then bind!
    elsif should_detonate? then detonate!
    elsif should_attack?   then attack!
    elsif should_rescue?   then rescue!
    elsif should_walk?     then walk!
    end
  end

  def set_memories
    @previous_health = warrior.health
  end

end
