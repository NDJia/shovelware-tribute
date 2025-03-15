function love.conf(t)
    t.window.width = 1920
    t.window.height = 1080
    t.window.title = "York Truck Simulator"
    
    -- disable unnecessary modules
    -- these have to do with joystick controls, physics engine, and touchscreen controls
    t.modules.joystick = false
    t.modules.physics = false
    t.modules.touch = false
end
