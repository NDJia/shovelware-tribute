local scene = {}

local cursorSelect = 0 -- 0: Play 1: Credits 2: Quit
local video = nil
local logo = nil

function scene.load()
  video = love.graphics.newVideo("assets/man-driving-automobile.ogv")
  video:play()
  
  logo = love.graphics.newImage("assets/truck_logo.png")
end

function scene.update(dt)
  if not video:isPlaying() then
    video:seek(0.1)
    video:play()
  end
  
end

function scene.draw()
  -- looping video goes first
  love.graphics.draw(video, 0, 0, 0, 0.75, 0.75)
  
  -- draw UI boxes
  love.graphics.push("all")
  
  -- title screen
--  love.graphics.setColor(1, 1, 1, 1)
--  love.graphics.rectangle("fill", width/5, 100, 3*width/5, 100)
--  love.graphics.setFont(title)
--  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.draw(logo, 50, 70, 0, 0.8, 0.8)
  
  love.graphics.translate(300, 0)
  -- play button
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.rectangle("fill", 2*width/5, 300, 400, 140)
  love.graphics.setFont(bigfont)
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.print("PLAY", 2.5*width/5 + 10, 340)
  
  -- credits button
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.rectangle("fill", 2*width/5, 450, 400, 100)
  love.graphics.setFont(smallfont)
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.print("Credits", 2.5*width/5 + 5, 470)
  
  -- quit button
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.rectangle("fill", 2*width/5, 560, 400, 100)
  love.graphics.setFont(smallfont)
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.print("Quit", 2.5*width/5 + 20, 580)
  
  love.graphics.pop("all")
end




return scene