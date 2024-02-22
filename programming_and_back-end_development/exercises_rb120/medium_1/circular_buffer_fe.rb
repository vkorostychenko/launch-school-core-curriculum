=begin
Your task is to write a CircularBuffer class that implements a circular buffer
for arbitrary objects. The class should obtain the buffer size with an argument
provided to CircularBuffer::new, and should provide the following methods:

put to add an object to the buffer
get to remove (and return) the oldest object in the buffer.
It should return nil if the buffer is empty.

You may assume that none of the values stored in the buffer are nil (however,
nil may be used to designate empty spots in the buffer).

Further Exploration

Phew. That's a lot of work, but it's a perfectly acceptable solution to this
exercise. However, there is a simpler solution that uses an Array, and the #push
and #shift methods. See if you can find a solution that does this. And no,
you're not allowed to monkey-patch the Array class, though doing so may help you
determine what needs to be done.
=end

class CircularBuffer
  def initialize(size)
    @buffer = []
    @size = size
  end

  def put(value)
    get if full?
    buffer << value
  end

  def get
    buffer.shift
  end

  private

  attr_reader :buffer

  def full?
    buffer.size == @size
  end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil
