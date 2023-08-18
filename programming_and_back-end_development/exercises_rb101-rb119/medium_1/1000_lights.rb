=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is
connected to exactly one light that is initially off. You walk down the row of
switches and toggle every one of them. You go back to the beginning, and on this
second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go
back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat
this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and
returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on          
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is
[1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is
[1, 4, 9].

[(1), 1, 1, 1, 1] # start_switch = 1, step = 1
[1, (0), 1, 0, 1] # start_switch = 2, step = 2
[1, 0, (0), 0, 1] # start_switch = 3, step = 3
[1, 0, 0, (1), 1] # start_switch = 4, step = 4
[1, 0, 0, 1, (0)] # start_switch = 5, step = 5

=end

def weird_toggle(num)
  switches = (1..num).to_h { |i| [i, i = false] }

  1.upto(num) do |start_switch|
    (start_switch...num).step(start_switch) do |switch|
      switches[switch] = !switches[switch]
    end
  end

  switches.select { |_switch, status| status == true }.keys
end

p weird_toggle(5) == [1, 4]
p weird_toggle(10) == [1, 4, 9]
