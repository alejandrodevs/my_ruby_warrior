Dir[File.dirname(__FILE__) + '/warrior_helpers/*.rb'].each{ |file| require file }

module WarriorHelpers
  include Senses
  include Actions
  include Health
end
