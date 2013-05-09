require 'warrior_helpers'

class Warrior
  include ::WarriorHelpers

  attr_accessor :warrior

  def prepare warrior
    @warrior = warrior
  end

  def direction
    set_direction
  end

  def play!
    if taking_damage? && dying? then retire!
    elsif retired? && !fit? then rest!
    elsif feel.empty? then safe? ? walk! : (shooters?(1) || shooters?(2)) ? shoot! : walk!
    elsif !feel.empty? then feel.captive? ? rescue! : attack!
    end
  end

  def memories
    @prev_health = warrior.health
  end

end

