local r = require("robot")

x,y = 0,1
r.select(1)

function place()
  if r.count>0 then
    r.placeDown()
  else
    for inv=1,16 do
      r.select(inv)
      if r.count>0 then brake() end
      if inv=16 and r.count()<1 then nonono() end
    end
  end
end

function nonono() 
--   print('Please, add a material')
  error('Game is over')
end

while not r.detect() do
  r.forward()
  place()
  x = x+1
end

r.turnRight()

while not r.detect() do
  r.forward()
  place()
  y = y+1
end

r.turnRight

while x>0 and y>0 do

   for i=x,0,-1 do
   r.forward()
   place()
   end
   x = x-1
   r.turnRight()

   for j=y,0,-1 do
   r.forward()
   place()
   end
   y = y-1
   r.turnRight

end
print('Good job!')
