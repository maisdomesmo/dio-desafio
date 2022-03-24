Ball = Class{}

function Ball:init(x, y, radius)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.dy = math.random(2) == 1 and -100 or 100
    self.dx = math.random(2) == 1 and math.random(-80, -100) or math.random(80, 100)
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt * 5
    self.y = self.y + self.dy * dt * 5
end

function Ball:newball()
    if Ball:collides(edge) == false then
        return true
    end
end

function Ball:collides(edge)
    if self.x > edge.x + edge.width or edge.x > self.x + self.width then
        return false
    end
    if self.y > edge.y + edge.height or edge.y > self.y + self.height then
        return false
    end 
    return true
end

function colisao(circle, ball)
    local dist = math.sqrt((circle.y - ball.y)^2 + (circle.x - ball.x)^2)
    return dist <= (15 + 15)
                    --circle.radius + ball.radius
end


function Ball:lose()
    if colisao(circle,ball) == true then
        return true
    end
end
