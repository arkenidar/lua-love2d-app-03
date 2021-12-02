local star_size=64,star_empty,star_filled
function love.load()
star_empty=love.graphics.newImage("star_empty.png")
star_filled=love.graphics.newImage("star_filled.png")
end

function point_in_rectangle_check(point, rectangle)
return point[1]>=rectangle[1] and
    point[1]<=(rectangle[1]+rectangle[3]) and
    
    point[2]>=rectangle[2] and
    point[2]<=(rectangle[2]+rectangle[4])
end

function star_vote_draw(star_vote)
local max=5
if star_vote.max~=nil then
    max=star_vote.max
end
local ox,oy=star_vote[1],star_vote[2]
local rectangle={ox,oy,star_size*max, star_size}
local point={love.mouse.getX(),love.mouse.getY()}
local vote
if point_in_rectangle_check(point,rectangle) then
    vote=(love.mouse.getX()-ox)/star_size
    if love.mouse.isDown(1) then
        star_vote.vote=vote
    end
else
    vote=star_vote.vote
end
local which_star
for i=0,(max-1) do
    if i<vote then
        which_star=star_filled
    else
        which_star=star_empty
    end
    love.graphics.draw(which_star,i*star_size+ox,oy)
end
end

local star_vote1={50,0,vote=1}
local star_vote2={0,star_size,vote=2,max=7}
function love.draw()
star_vote_draw(star_vote1)
star_vote_draw(star_vote2)
end
