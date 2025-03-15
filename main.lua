--[[
    PROGRAMMING STYLE GUIDE
    - quick Lua reference: https://learnxinyminutes.com/lua/
    - add things that hurt the player to "obstacles" table
    - add background decoration to "decor" table
    - each scene must be in its own file
      - check StackingSceneMgr.lua documentation for more information: https://gitlab.com/V3X3D/love-libs/-/tree/master/StackingSceneMgr
    - use Building class in obstacles.lua as guideline for OOP
--]]

--function love.load()
--    video = love.graphics.newVideo("assets/man-driving-automobile.ogv")
--    video:play()
--end

--function love.draw()
--    love.graphics.draw(video, 0, 0)
--end

-- require and setup libraries
SSM = require "lib.StackingSceneMgr".newManager()
SSM.setPath("scenes/")

-- require utility modules
require "obstacles"
require "player"

function love.load()
  width, height = love.graphics.getDimensions()
  
  SSM.add("testscene")
end

function love.update(dt)
  --love.graphics.setBackgroundColor(0, 0, 0)
  SSM.update(dt)
end

function love.draw()
  SSM.draw()
end


function polarToPixel(centreX, centreY, r, angle)
  return centreX + r*math.cos(angle), centreY + r*math.sin(angle)
end
