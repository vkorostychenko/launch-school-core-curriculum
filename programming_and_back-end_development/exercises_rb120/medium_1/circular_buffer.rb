=begin
Your task is to write a CircularBuffer class that implements a circular buffer
for arbitrary objects. The class should obtain the buffer size with an argument
provided to CircularBuffer::new, and should provide the following methods:

put to add an object to the buffer
get to remove (and return) the oldest object in the buffer.
It should return nil if the buffer is empty.

You may assume that none of the values stored in the buffer are nil (however,
nil may be used to designate empty spots in the buffer).
=end

class CircularBuffer
  def initialize(max_size)
    @buffer = {} # should be able to store objects of any type
    @max_size = max_size
    @id = 1
  end

  def put(value)
    buffer.delete(find_min_id) if buffer.size >= @max_size
    buffer[id] = value
    increment_id
  end

  # should return the earliest value added or nil
  def get
    buffer.delete(find_min_id) if find_min_id
  end

  private

  attr_reader :buffer, :id

  def increment_id
    @id += 1
  end

  def find_min_id
    buffer.min.last if buffer.any?
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
