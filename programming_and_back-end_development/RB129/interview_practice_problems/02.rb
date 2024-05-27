# Problem received from Raul Romero
class Human 
  attr_reader :name

  def initialize(name="Dylan")
    @name = name
  end
end

puts Human.new("Jo").hair_colour("blonde")
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_colour("")
# Should "Hi, my name is Dylan and I have blonde hair."
