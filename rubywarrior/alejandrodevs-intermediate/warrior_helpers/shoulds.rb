module WarriorHelpers
  module Shoulds

    def should_rest?
      !in_shape? && safe?
    end

    def should_walk?
      safe? && empty_around?
    end

    def should_attack?
      !safe?
    end

    def should_bind?
      enemies_amount > 1
    end

    def should_rescue?
      there_captives?
    end

  end
end
