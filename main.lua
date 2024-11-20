function love.load()
    -- initial values
    x = 100
    y = 100
    w = 100
    h = 100

    -- initial speed
    velX = 1
    velY = 1

    -- initial colors
    bgColor = {0.4, 0.4, 0.4, 1}
    fgColor = {0, 0.5, 1, 1}
    step = 1/200
    colorStep = {step, step, -step}
    
    -- window title
    love.window.setTitle("LÖVE demo")
end

function love.update()
    -- check for wall collisions
    if (x < 0 or x + w > love.graphics.getWidth()) then
        velX = -velX
    end
    if (y < 0 or y + h > love.graphics.getHeight()) then
        velY = -velY
    end

    -- move rectangle
    x = x + velX;
    y = y + velY;

    -- change colors
    for i = 1, 3 do
        if (fgColor[i] <= 0) then colorStep[i] =  step end
        if (fgColor[i] >= 1) then colorStep[i] = -step end
        fgColor[i] = fgColor[i] + colorStep[i]
    end
end

function love.draw()
    love.graphics.setBackgroundColor(bgColor)
    love.graphics.setColor(fgColor)
    love.graphics.rectangle('fill', x, y, w, h)
end