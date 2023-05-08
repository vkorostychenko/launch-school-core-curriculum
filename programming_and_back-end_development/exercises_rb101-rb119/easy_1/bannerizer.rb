def print_in_box(message)
  width = message.length
  border = '+-' + '-' * width + '-+'
  empty_line = '| ' + ' ' * width + ' |'
  
  puts border
  puts empty_line
  puts '| ' + message + ' |'
  puts empty_line
  puts border
  
end

print_in_box('To boldly go where no one has gone before.')
