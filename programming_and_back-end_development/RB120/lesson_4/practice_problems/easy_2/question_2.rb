=begin
We have an Oracle class and a RoadTrip class that inherits from the Oracle
class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future
=end

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future

# Now the string returned will be of the form "You will <some trip>" where
# the trip is taken from the choices defined by the choices method of RoadTrip.
