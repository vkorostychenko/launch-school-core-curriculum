# Unknown

class BenjaminButton
  DIE_AGE = 100

  attr_reader :actual_age, :appearance_age

  def initialize
    @actual_age = 0
    @appearance_age = DIE_AGE
  end

  def actual_age=(value)
    @actual_age = value
    @appearance_age = DIE_AGE - value
  end

  def get_older
    @actual_age += 1
    @appearance_age -= 1
  end

  def look_younger
  end

  def die
    self.actual_age = DIE_AGE
  end
end

benjamin = BenjaminButton.new
p benjamin.actual_age # => 0
p benjamin.appearance_age # => 100

benjamin.actual_age = 1
p benjamin.actual_age

benjamin.get_older
p benjamin.actual_age # => 2
p benjamin.appearance_age # => 99 # Here, I'm assuming this was a typo, and the value should be 98

benjamin.die
p benjamin.actual_age # => 100
p benjamin.appearance_age # => 0
