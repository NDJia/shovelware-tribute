--function love.load()
--    video = love.graphics.newVideo("assets/man-driving-automobile.ogv")
--    video:play()
--end

--function love.draw()
--    love.graphics.draw(video, 0, 0)
--end

-- require and initial setup libraries
SSM = require "lib.StackingSceneMgr".newManager()
SSM.setPath("scenes/")

-- require and initial setup utility files
require "obstacles"
require "player"

function love.load()
  SSM.add("testscene")
end

function love.update(dt)
  
end

function love.draw()
  SSM.draw()
end
