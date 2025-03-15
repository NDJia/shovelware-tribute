local scene = {}

function scene.load()
  video = love.graphics.newVideo("assets/man-driving-automobile.ogv")
  video:play()
end

function scene.update(dt)
  
end

function scene.draw()
  love.graphics.draw(video, 0, 0)
end




return scene