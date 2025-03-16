-- LANES: 0 = left; 1 = centre; 2 = right

player = {
  health = 3,
  lane = 1
}

--function player:update()
  
--end

function player:draw(angle)
  love.graphics.push("all")
  fc = 0.3 -- frameColor : fc,fc,fc,1
  wc = 0.1 -- wheelColor : wc, wc, wc, 1 
  drawFrame(fc)
  drawWheel(fc, wc, angle)
  love.graphics.pop("all")
end

function drawFrame(fc)
  frame_width = 30
  screen_beside_frame = 90
  love.graphics.setColor(fc, fc, fc, 1);  
  love.graphics.polygon("fill", 0, 0, frame_width, 0, screen_beside_frame + frame_width, height, screen_beside_frame, height)  
  love.graphics.polygon("fill", width - frame_width, 0 , width, 0, width - screen_beside_frame, height, width - screen_beside_frame - frame_width, height)
  love.graphics.circle("fill", width/2, height * 5, height * 4 + 200)
end

function drawWheel(fc, wc, angle)
  wheel_centre_width = width/4
  wheel_centre_height = height
  wheel_size = 200
  wheel_radius = wheel_size
  wheel_space_radius = wheel_size * 0.85
  wheel_core_radius = wheel_size * 0.6

  love.graphics.setColor(wc,wc,wc,1);
  love.graphics.circle("fill", wheel_centre_width, wheel_centre_height, wheel_radius)
  love.graphics.setColor(fc, fc, fc, 1);
  love.graphics.circle("fill", wheel_centre_width, wheel_centre_height, wheel_space_radius)
  love.graphics.setColor(wc,wc,wc,1);
  love.graphics.circle("fill", wheel_centre_width, wheel_centre_height, wheel_core_radius)
  drawStick(wheel_centre_width,wheel_centre_height,wheel_radius,wheel_core_radius,wc, angle)
  drawHorn(wheel_centre_width,wheel_centre_height, wheel_size )
end

function degree2Rad(degree)
  return degree * math.pi / 180
end
function drawStick(centreW, centreH, wheel_radius, wheel_core_radius, wc, angle)
  local innerAngle = 70
  local outerAngle = 80
  angle = angle + 90
  -- Left trapezoid points
  local ptUpperLeftInnerWidth, ptUpperLeftInnerHeight = calculateVertex(centreW, centreH, wheel_core_radius, angle - innerAngle)
  local ptLowerLeftInnerWidth, ptLowerLeftInnerHeight = calculateVertex(centreW, centreH, wheel_core_radius, angle - 180 + innerAngle)
  local ptUpperLeftOuterWidth, ptUpperLeftOuterHeight = calculateVertex(centreW, centreH, wheel_radius, angle - outerAngle)
  local ptLowerLeftOuterWidth, ptLowerLeftOuterHeight = calculateVertex(centreW, centreH, wheel_radius, angle - 180 + outerAngle)

  -- Right trapezoid points
  local ptUpperRightInnerWidth, ptUpperRightInnerHeight = calculateVertex(centreW, centreH, wheel_core_radius, angle + innerAngle)
  local ptLowerRightInnerWidth, ptLowerRightInnerHeight = calculateVertex(centreW, centreH, wheel_core_radius, angle + 180 - innerAngle)
  local ptUpperRightOuterWidth, ptUpperRightOuterHeight = calculateVertex(centreW, centreH, wheel_radius, angle + outerAngle)
  local ptLowerRightOuterWidth, ptLowerRightOuterHeight = calculateVertex(centreW, centreH, wheel_radius, angle + 180 - outerAngle)

  -- Draw left trapezoid
  love.graphics.setColor(wc, wc, wc, 1)
  love.graphics.polygon("fill",
      ptUpperLeftInnerWidth, ptUpperLeftInnerHeight,
      ptUpperLeftOuterWidth, ptUpperLeftOuterHeight,
      ptLowerLeftOuterWidth, ptLowerLeftOuterHeight,
      ptLowerLeftInnerWidth, ptLowerLeftInnerHeight
  )

  -- Draw right trapezoid
  love.graphics.polygon("fill",
      ptUpperRightInnerWidth, ptUpperRightInnerHeight,
      ptUpperRightOuterWidth, ptUpperRightOuterHeight,
      ptLowerRightOuterWidth, ptLowerRightOuterHeight,
      ptLowerRightInnerWidth, ptLowerRightInnerHeight
  )
end

-- Helper function for coordinate calculation
function calculateVertex(cx, cy, radius, angle)
  return cx + (radius * math.cos(degree2Rad(angle))),
         cy + (radius * math.sin(degree2Rad(angle)))
end

function drawHorn(centreW, centreH, size)
  hornRad = size * 0.6 * 0.7
  love.graphics.setColor(0.6, 0.6, 0.8, 1);
  love.graphics.circle("fill", centreW, centreH, hornRad)
end