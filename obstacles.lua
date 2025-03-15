-- list of enemies here
-- things in enemies check for collision
enemies = {}

-- list decor here
-- decor does not check for collision, use for things outside the player bounds
decor = {}

-- building class
Building = {}

-- Set speed of movement
speed = 3

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

