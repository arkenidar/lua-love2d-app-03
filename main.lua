
function love.load()
star1=love.graphics.newImage("star1.png")
star2=love.graphics.newImage("star2.png")
end

function love.draw()
local size=64
local vote=love.mouse.getX()/size
local which_star
for i=0,4 do
    if i<vote then
        which_star=star2
    else
        which_star=star1
    end
    love.graphics.draw(which_star,i*size,0)
end
end
