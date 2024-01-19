=begin
If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model
=end

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
# tv.manufacturer # this will throw an undefined method error
tv.model # this will invoke an instance method #model

Television.manufacturer # this will invoke a class method #manufacturer
# Television.model # this will throw an undefined method error
