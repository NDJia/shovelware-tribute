function love.load()
    video = love.graphics.newVideo("assets/man-driving-automobile.ogv")
    video:play()
end

function love.draw()
    love.graphics.draw(video, 0, 0)
end