# this is just me studying fibonacci, and recursion, helpful articles:
# https://www.natashatherobot.com/recursion-factorials-fibonacci-ruby/
# https://medium.com/launch-school/recursive-fibonnaci-method-explained-d82215c5498e

def fibonacci(n)
  if n < 2
    n
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end  

