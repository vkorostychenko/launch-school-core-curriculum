=begin
Difficulty: ___

A child is playing with a ball on the nth floor of a tall building. The height 
of this floor, h, is known.

He drops the ball out of the window. The ball bounces (for example), to 
two-thirds of its height (a bounce of 0.66).

His mother looks out of a window 1.5 meters from the ground.

How many times will the mother see the ball pass in front of her window (including 
when it's falling and bouncing?

Three conditions must be met for a valid experiment:
- Float parameter "h" in meters must be greater than 0
- Float parameter "bounce" must be greater than 0 and less than 1
- Float parameter "window" must be less than h.

If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

Note:
- The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

Example:

- h = 3, bounce = 0.66, window = 1.5, result is 3

- h = 3, bounce = 1, window = 1.5, result is -1 
(Condition 2) not fulfilled).

Input: three numbers (integer and float)
Output: a positive integer or -1

Rules:
  - given 3 numbers
  - Three conditions must be met for a valid experiment:
    - Float parameter "h" in meters must be greater than 0
    - Float parameter "bounce" must be greater than 0 and less than 1
    - Float parameter "window" must be less than h.
    - The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.
   - If all three conditions above are fulfilled, return a positive integer representing how many times mother can see the ball, otherwise return -1

Algorithm:
  - given three numbers
  - check if 'h' is greater than 0
  - check if 'bounce' is between 0 and 1 (exclusively)
  - check if 'window' is less than 'h'
  - if all three conditions are true:
    - initialize a local variable counter to 1
    - reassign the 'h' to the return value of multiplying 'h' by 'bounce'
    - while the 'h' is greater than 'window'
      - reassign the 'h' to the return value of multiplying 'h' by 'bounce'
      - increment counter by 2
    - return counter
  - otherwise return -1
=end

def bouncingBall(height, bounce, window)
  if height > 0 && bounce >= 0 && bounce < 1 && window < height
    counter = 1
    height = height * bounce
  
    while height > window
      height = height * bounce
      counter += 2
    end
  
    return counter
  end

  -1
end

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1
