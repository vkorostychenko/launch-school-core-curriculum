def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# The 'rolling_buffer1' method is using the operator '<<' which mutates the object, 
# so the method has a side effect and returns a value. This is a bad practice.

# The 'rolling_buffer2' method is using the operator '=' which creates a new object, 
# so the method has no side effects and returns a value.

# The 'rolling_buffer2' method is better.
