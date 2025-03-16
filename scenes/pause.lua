local scene = {}

function scene.load()
  
end

function scene.update(dt)
  
end

function scene.draw()
  love.graphics.push("all")
  
  love.graphics.setColor(1, 1, 1, 0.5)
  love.graphics.rectangle("fill", 0, 0, width, height)
  
  love.graphics.pop("all")
end




return scene