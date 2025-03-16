local scene = {}

local finalScore = 0
local youreWinner = nil

function scene.load()
  finalScore = player.health + player.score
  youreWinner = love.graphics.newImage("assets/truck_yourewinner.png")
end

function scene.update(dt)
  
end

function scene.draw()
  love.graphics.push("all")
  
  love.graphics.setColor(1, 1, 0, 1)
  love.graphics.rectangle("fill", 0, 0, width, height)
  
  
  love.graphics.reset()
  love.graphics.draw(youreWinner, width/2 - 350, -50, 0, 1.2, 1.2)
  
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.setFont(bigfont)
  
  love.graphics.print("Time: "..player.time, width/2 - 130, 400)
  love.graphics.print("Score: "..player.score, width/2 - 130, 440)
  love.graphics.print("Lives Left: "..player.health, width/2 - 150, 480)
  
  love.graphics.setFont(title)
  love.graphics.print("FINAL SCORE: "..finalScore, width/2 - 230, 550)
  
  love.graphics.setFont(smallfont)
  love.graphics.print("To return to the main menu, press the Enter", width/2 - 330, 620)
  
  love.graphics.pop("all")
end


function love.keypressed(key, scancode, isrepeat)
  if key == "return" then 
    SSM.add("mainmenu")
    SSM.purge("game")
    SSM.remove("end")
  end
  
end


return scene