local star_size,star_empty,star_filled
function love.load()
star_size=64
star_empty=love.graphics.newImage("star_empty.png")
star_filled=love.graphics.newImage("star_filled.png")
end

function love.draw()
local vote=love.mouse.getX()/star_size
local which_star
for i=0,4 do
    if i<vote then
        which_star=star_filled
    else
        which_star=star_empty
    end
    love.graphics.draw(which_star,i*star_size,0)
end
end
