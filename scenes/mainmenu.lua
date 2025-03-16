local scene = {}

local cursorSelect = 0 -- 0: Play 1: Credits 2: Quit
local video = nil
local logo = nil
local drawCredits = false

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
  
  love.graphics.setColor(1, 1, 0, 1)
  love.graphics.setLineWidth(10)
  -- highlight current option
  if cursorSelect <= 0 then love.graphics.rectangle("line", 2*width/5, 300, 400, 140)
  elseif cursorSelect == 1 then love.graphics.rectangle("line", 2*width/5, 450, 400, 100)
  else love.graphics.rectangle("line", 2*width/5, 560, 400, 100)
  end

  love.graphics.pop("all")
  
  if drawCredits then drawCreditsBox() end
  
  
  
  if cursorSelect < -15 or cursorSelect > 15 then love.event.quit() end
end

function love.keypressed(key, scancode, isrepeat)
  if drawCredits then drawCredits = false
  elseif key == "return" then
    if cursorSelect <= 0 then
      SSM.add("game")
      SSM.purge("mainmenu")
    elseif cursorSelect == 1 then
      drawCredits = true
    else
      love.event.quit()
    end
  elseif key == "down" then
    if cursorSelect < 0 then cursorSelect = 0 end
    cursorSelect = cursorSelect + 1
  elseif key == "up" then
    if cursorSelect > 2 then cursorSelect = 2 end
    cursorSelect = cursorSelect - 1
  end
end

function drawCreditsBox()
  love.graphics.push("all")
  
  love.graphics.setColor(1, 1, 1, 0.95)
  love.graphics.rectangle("fill", width/8, height/8, 6*width/8, 6*height/8)
  
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.setFont(title)
  love.graphics.print("YORK TRUCK SIMULATOR", width/2 - 310, height/8 + 20)
  
  love.graphics.setFont(bigfont)
  love.graphics.print("by Apeiron Cheung, N.D. Jia, and Emily Terra", width/2 - 430, height/8 + 120)
  
  love.graphics.setFont(smallfont)
  love.graphics.print("Using stock images and sounds by:\nErkan Avanoğlu\nKelly Lacy\nJerry Berumen\nTim Kahn\nmusicvision31", width/8 + 80, height/8 + 230)
  
  love.graphics.print("(press any key to return to menu)", width/2 - 280, 7*height/8 - 50)
  
  love.graphics.pop("all")
end



return scene