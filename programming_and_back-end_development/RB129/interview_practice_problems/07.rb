# Unknown

class BenjaminButton 
  
  def initialize
  end
  
  def get_older
  end
  
  def look_younger
  end
  
  def die
  end
end

class BenjaminButton
end


benjamin = BenjaminButton.new
p benjamin.actual_age # => 0
p benjamin.appearance_age # => 100

benjamin.actual_age = 1
p benjamin.actual_age

benjamin.get_older
p benjamin.actual_age # => 2
p benjamin.appearance_age # => 99

benjamin.die
p benjamin.actual_age # => 100
p benjamin.appearance_age # => 0
