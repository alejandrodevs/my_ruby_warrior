require 'warrior_helpers'

class Warrior
  include ::WarriorHelpers

  attr_accessor :warrior

  def prepare warrior
    @warrior = warrior
  end

  def play!
    if taking_damage? && dying?
      retire!
    elsif retired? && !fit?
      rest!
    elsif feel.empty?
      if safe?
        walk!
      else
        shoot!
      end
    elsif !feel.empty?
      rescue! if feel.captive?
      attack! if !feel.captive?
    end
  end

  def memories
    @prev_health = warrior.health
  end

end

