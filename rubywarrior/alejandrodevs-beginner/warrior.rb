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
    @to = direction
  end

  def play!
    if    should_retire? then retire!
    elsif should_rest?   then rest!
    elsif should_walk?   then walk!
    elsif should_shoot?  then shoot!
    elsif feel.enemy?    then attack!
    elsif feel.captive?  then rescue!
    end

    @previous_health = warrior.health
  end

end
