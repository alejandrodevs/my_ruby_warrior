require 'warrior_helpers'

class Warrior
  include ::WarriorHelpers

  attr_accessor :warrior

  def prepare warrior
    @warrior = warrior
  end

  def direction
    @to = set_direction
  end

  def play!
    if should_retire? then retire!
    elsif should_rest? then rest!
    elsif feel.empty? then safe? ? walk! : should_shoot? ? shoot! : walk!
    elsif !feel.empty? then feel.captive? ? rescue! : attack!
    end
  end

  def memories
    @previous_health = warrior.health
  end

end

