# Problem received from Raul Romero
class Human
  attr_reader :name

  def initialize(name)
  end
end

gilles = Human.new("gilles")
anna = Human.new("gilles")

puts anna.equal?(gilles) #should output true
puts anna + gilles # should output annagilles
