# From Joseph Ochoa
# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing 

  # class inheritance

  # class Monster
  #   def attack
  #     "attacks!"
  #   end
  # end

  # class Barbarian < Monster; end

  # interface inheritance

  # module Attackable
  #   def attack
  #     "attacks!"
  #   end
  # end

  # class Monster
  #   include Attackable
  # end

  # class Barbarian < Monster; end
  
  # p Barbarian.new.attack

  # duck-typing

#   class Monster
#     def attack
#       "attacks!"
#     end
#   end

#   class Barbarian
#     def attack
#       "attacks!"
#     end
#   end

# [Monster.new, Barbarian.new].each { |character| p character.attack }

# directly

  class Monster
    def attack
      "attacks!"
    end
  end

  class Barbarian
    def attack
      "attacks!"
    end
  end

p Monster.new.attack
