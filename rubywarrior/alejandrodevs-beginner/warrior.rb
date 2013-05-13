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
    @to = set_direction
  end

  def play!
    if should_retire? then retire!
    elsif should_rest? then rest!
    elsif feel.empty? then safe? ? walk! : should_shoot? ? shoot! : walk!
    elsif !feel.empty? then feel.captive? ? rescue! : attack!
    end
    @previous_health = warrior.health
  end

end
