local r = require("robot")

r.select(1)

function place()
  if r.count>0 then
    r.placeDown()
  else
    for inv=1,16 do
      r.select(inv)
      if r.count>0 then brake() end
    end
  end
end
