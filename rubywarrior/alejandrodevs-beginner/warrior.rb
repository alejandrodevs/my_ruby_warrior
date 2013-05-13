require 'warrior_helpers'

class Warrior
  include ::WarriorHelpers

  attr_accessor :warrior

  def initialize
    @attacks = 0
    @shoots  = 0
  end

  def prepare warrior
    @warrior = warrior
  end

  def play!
    if    should_pivot?  then pivot!
    elsif should_retire? then retire!
    elsif should_rest?   then rest!
    elsif should_walk?   then walk!
    elsif should_shoot?  then shoot!
    elsif should_attack? then attack!
    elsif should_rescue? then rescue!
    end
  end

  def set_memories
    @previous_health = warrior.health
  end

end
