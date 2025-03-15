-- LANES: 0 = left; 1 = centre; 2 = right

player = {
  health = 3,
  lane = 1
}

--function player:update()
  
--end


function player:draw()
  love.graphics.push("all")
  
  love.graphics.setColor(0.6, 0.6, 0.6, 1);
  love.graphics.rectangle("fill", 0, 5*height/6, width, height)
  
  love.graphics.rectangle("fill", 0, 0, width/7, height)
  
  love.graphics.rectangle("fill", 6*width/7, 0, width, height)
  
  love.graphics.pop("all")
end
