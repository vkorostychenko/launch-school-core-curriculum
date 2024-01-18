=begin
If we have the class below, what would you need to call to create a new instance
of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end
=end

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

fashion_bag = Bag.new('red', 'leather')

p fashion_bag # #<Bag:0x0000000101690468 @color="red", @material="leather">
