# Create a module for the class you created in exercise 1 and include it properly.

module Speak
  def speak(sound)
    puts sound
  end
end

class Animal
  include Speak
end

class Human
  include Speak
end

hedgehog = Animal.new
vlad = Human.new

hedgehog.speak("#{hedgehog.class} speaks...")
vlad.speak("#{vlad.class} speaks...")
