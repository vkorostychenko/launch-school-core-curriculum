# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name.
# The first time you boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while, we need to reset a robot to its factory settings,
# which means that their name gets wiped. The next time you ask, it will respond
# with a new random name.

# The names must be random; they should not follow a predictable sequence.
# Random names means there is a risk of collisions. Your solution should not allow
# the use of the same name twice.

class Robot
  @@taken_names = []

  def name
    return @name if @name

    loop do
      potential_name = generate_name
      next if @@taken_names.include?(potential_name)

      @@taken_names << potential_name
      @name = potential_name
      break
    end

    @name
  end

  def reset
    @@taken_names.delete(name)
    @name = nil
  end

  private

  def generate_name
    "#{('A'..'Z').to_a.sample(2).join}#{rand(100..999)}"
  end
end
