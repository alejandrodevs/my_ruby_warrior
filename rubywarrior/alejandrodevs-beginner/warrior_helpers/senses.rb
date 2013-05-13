Dir[File.dirname(__FILE__) + '/senses/*.rb'].each{ |file| require file }

module WarriorHelpers
  module Senses
    include Basics
    include Shoulds
    include Enemies
    include Helpers
    include Battlefield
  end
end
