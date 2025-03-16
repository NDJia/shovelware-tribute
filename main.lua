--[[
    PROGRAMMING STYLE GUIDE
    - quick Lua reference: https://learnxinyminutes.com/lua/
    - add things that hurt the player to "obstacles" table
    - add background decoration to "decor" table
    - each scene must be in its own file
      - check StackingSceneMgr.lua documentation for more information: https://gitlab.com/V3X3D/love-libs/-/tree/master/StackingSceneMgr
    - use Building class in obstacles.lua as guideline for OOP
    
    - main.lua should be used for game state control, logic should go in relevant scene files
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
require "sound"

-- state tracking
state = "menu"
-- values: menu, game, turn (for cutscene), pause, end

function love.load()
  -- set width and height constants
  width, height = love.graphics.getDimensions()
  
  -- set up fonts for use throughout the game
  title = love.graphics.newFont("assets/NotoSans.ttf", 50)
  bigfont = love.graphics.newFont("assets/NotoSans.ttf", 40)
  smallfont = love.graphics.newFont("assets/NotoSans.ttf", 30)
  
  -- load audio
  titlesfx = love.audio.newSource("audio/menusfx.ogg", "stream")
  gamebgm = love.audio.newSource("audio/bgm.ogg", "stream")
  radiovoice = {}
  for i = 1, 4 do
    radiovoice[i] = love.audio.newSource("audio/rockradio"..i..".ogg", "stream")
  end
  
  
  -- SSM.add("game")
  SSM.add("game")
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
