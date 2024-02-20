=begin
Write a class that implements a miniature stack-and-register-based
programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value

All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument.
Your program should produce an error if an unexpected item is present in the string,
or if a required stack value is not on the stack when it should be (the stack is empty).
In all error cases, no further processing should be performed on the program.

You should initialize the register to 0.
=end

class Minilang
  def initialize(instructions)
    @instructions = instructions
    @register = 0
    @stack = []
  end

  def eval
    @instructions.split.each do |value|
      if value.to_i.to_s == value
        @register = value.to_i
      else
        case value
        when 'PUSH'          then push
        when 'ADD'           then add
        when 'SUB'           then sub
        when 'MULT'          then mult
        when 'DIV'           then div
        when 'MOD'           then mod
        when 'POP'           then pop
        when 'PRINT'         then print
        else
          return puts "Invalid token: #{value}"
        end
      end
    end
  end

  private

  def push
    @stack << @register
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end

  def pop
    @register = @stack.pop
  end

  def print
    @register.nil? ? puts('Empty stack!') : puts(@register)
  end
end

puts '-----'
Minilang.new('PRINT').eval
# 0

puts '-----'
Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

puts '-----'
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

puts '-----'
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

puts '-----'
Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

puts '-----'
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

puts '-----'
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

puts '-----'
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

puts '-----'
Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

puts '-----'
Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
