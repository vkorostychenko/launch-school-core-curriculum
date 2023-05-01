greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # {:a=>"hi there"}

puts greetings[:a].object_id == informal_greeting.object_id # true
