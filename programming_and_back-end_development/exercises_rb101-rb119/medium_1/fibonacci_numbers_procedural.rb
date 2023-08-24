=begin
In the previous exercise, we developed a recursive solution to calculating
the nth Fibonacci number. In a language that is not optimized for recursion,
some (not all) recursive methods can be extremely slow and require massive
quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for
heavy recursion; as a result, the Fibonacci solution is only useful up to about
fibonacci(40). With higher values of nth, the recursive solution is impractical.
(Our tail recursive solution did much better, but even that failed at around
fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive
(procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without
recursion.

fib(0) = 0
fib(1) = 1
fib(2) = fib(1) + fib(0)
fib(3) = fib(2) + fib(1)
...
fib(n) = fib(n - 1) + fib(n - 2)

fib(0) => 0
fib(1) => 1
fib(2) => 0 + 1 = 1
fib(3) => 1 + 1 = 2
fib(4) => 2 + 1 = 3
fib(5) => 3 + 2 = 5
fib(6) => 5 + 3 = 8
fib(7) => 8 + 5 = 13
fib(8) => 13 + 8 = 21
=end

def fibonacci(n)
  first, second = [0, 1]

  (2..n).each do
    first, second = [second, first + second]
  end

  second
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
