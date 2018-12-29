function love.load()
    ballX = love.graphics.getWidth() / 2
    ballY = love.graphics.getHeight() / 2
    ballRad = 5
    ballSpeedX, ballSpeedY = love.math.random(100,200), love.math.random(100,200)

    paddleWidth = 10
    paddleHeight = 80
    paddle1X = 30
    paddle1Y = 10
    paddle2X = love.graphics.getWidth() - paddle1X - paddleWidth
    paddle2Y = 10
    paddleSpeed = 300
end

function love.update(dt)
    ballX = ballX + ballSpeedX * dt
    ballY = ballY + ballSpeedY * dt

    if ballX < 0 then 
        ballX = 0
        ballSpeedX = -ballSpeedX
    end

    if ballX > love.graphics.getWidth() then
        ballX = love.graphics.getWidth()
        ballSpeedX = -ballSpeedX
    end

    if ballY < 0 then
        ballY = 0
        ballSpeedY = -ballSpeedY
    end

    if ballY > love.graphics.getHeight() then
        ballY = love.graphics.getHeight()
        ballSpeedY = -ballSpeedY
    end 

    
    if love.keyboard.isDown('w') then
        paddle1Y = paddle1Y - paddleSpeed * dt
    end
    if love.keyboard.isDown('s') then
        paddle1Y = paddle1Y + paddleSpeed * dt
    end
    if love.keyboard.isDown('up') then
        paddle2Y = paddle2Y - paddleSpeed * dt
    end
    if love.keyboard.isDown('down') then
        paddle2Y = paddle2Y + paddleSpeed * dt
    end

    paddle1Y = math.clamp(paddle1Y, 0, love.graphics.getHeight() - paddleHeight)
    paddle2Y = math.clamp(paddle2Y, 0, love.graphics.getHeight() - paddleHeight)

end

function love.draw()
    love.graphics.circle('fill', ballX, ballY, ballRad)
    love.graphics.print(string.format("%.0f", ballX), 10, 10)

    love.graphics.rectangle('fill', paddle1X, paddle1Y, paddleWidth, paddleHeight)
    love.graphics.rectangle('fill', paddle2X, paddle2Y, paddleWidth, paddleHeight)
end

function math.clamp(value, min, max) 
    return math.max(math.min(value, max), min)
end