local scene = {}

local cursorSelect = 0 -- 0: Play 1: Credits 2: Quit

function scene.load()
  video = love.graphics.newVideo("assets/man-driving-automobile.ogv")
  video:play()
end

function scene.update(dt)
  if not video:isPlaying() then
    video:seek(0.1)
    video:play()
  end
  
end

function scene.draw()
  -- looping video goes first
  love.graphics.draw(video, 0, 0)
  
  -- draw UI boxes
  love.graphics.push("all")
  
  love.graphics.pop("pop")
end




return scene