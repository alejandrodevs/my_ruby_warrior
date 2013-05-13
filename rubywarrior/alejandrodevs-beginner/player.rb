require 'warrior'

class Player

  def initialize
    @warrior = Warrior.new
  end

  def play_turn warrior
    @warrior.prepare(warrior)
    @warrior.play!
    @warrior.set_memories
  end

end
