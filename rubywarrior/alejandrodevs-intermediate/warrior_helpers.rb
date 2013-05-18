Dir[File.dirname(__FILE__) + '/warrior_helpers/*.rb'].each{ |file| require file }

module WarriorHelpers
  include Basics
  include Senses
  include Actions
  include Health
  include Direction
  include Shoulds
end
