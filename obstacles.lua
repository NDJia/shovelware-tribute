-- list of enemies here
-- things in enemies check for collision, must have collision data or there will be errors
enemies = {}

-- list decor here
-- decor does not check for collision, use for things outside the player bounds
decor = {}

-- Set speed of movement
speed = 3

-- load images
barrier1 = love.graphics.newImage("assets/truck_barrier1.png")
barrier2 = love.graphics.newImage("assets/truck_barrier2.png")
pothole = love.graphics.newImage("assets/truck_pothole.png")
obstacleImages = {barrier1, barrier2, pothole}
-- OBSTACLE OBJECTS
Obstacle = {}
function Obstacle:new(x, y, dist, setAngle, setLane)
  newObj = {
    centreX = x,
    centreY = y,
    r = dist,
    angle = setAngle,
    lane = setLane,
    img = obstacleImages[math.random(1, 3)]
    }
  
  self.__index = self
  
  return setmetatable(newObj, self)
end

function Obstacle:update()
  self.r = self.r + speed
end

function Obstacle:draw()
  love.graphics.push("all")
  local x, y = polarToPixel(self.centreX, self.centreY, self.r, self.angle)
  love.graphics.setColor(1, 0, 0, 1)
  love.graphics.draw(self.img, x, y)
  love.graphics.pop("all")
end

function removeObstacle(i)
  enemies[i] = nil
end


-- DECOR OBJECTS
-- building class
Building = {}
function Building:new(x, y, dist, setAngle)
  newObj = {
    centreX = x,
    centreY = y,
    r = dist,
    angle = setAngle
  }
  
  self.__index = self
  
  return setmetatable(newObj, self)
end


function Building:update()
  self.r = self.r + speed
end

function Building:draw()
  local x, y = polarToPixel(self.centreX, self.centreY, self.r, self.angle)
  love.graphics.rectangle("fill", x, y, 100, 100)
  
end

function changeCentreX(obj, rateChange)
  obj.centreX = obj.centreX + rateChange
end

