circle = {}
mouse = {}
ball = {}
Class = require 'class'
require 'Ball'
WINDOW_HEIGHT = 600
WINDOW_WIDTH = 800
gameState = 'start'
function love.load()
	ball = Ball(500, 500, 20) 

	circle.x = 300
	circle.y = 300
	circle.speed = 300
end

function love.keypressed(key)
	if key == 'enter' or key == 'return' and gameState == 'start' then
		gameState = 'play'
	elseif key == 'escape'  then
		love.event.quit()
	end
end

function love.update(dt)
	if ball:lose() == true then	
		gameState = 'start'
	end
	mouse.x, mouse.y = love.mouse.getPosition()

	if circle.x < mouse.x then
		circle.x = circle.x + (circle.speed * 2.5 * dt)
	end
	if circle.x > mouse.x then
		circle.x = circle.x - (circle.speed * 2.5 * dt)
	end
	if circle.y < mouse.y then
		circle.y = circle.y + (circle.speed * 2.5 * dt)
	end
	if circle.y > mouse.y then
		circle.y = circle.y - (circle.speed * 2.5 * dt)
	end
	
	if ball.y <= 20 or ball.y >= (WINDOW_HEIGHT-20) then
		ball.dy = -ball.dy
	end
	if ball.x <= 20 or ball.x >= (WINDOW_WIDTH-20) then
		ball.dx = -ball.dx
	end
	ball:update(dt)
end

if gameState == 'start' then
	function love.draw()
		love.graphics.setColor(255, 255, 255)
		love.graphics.printf("BEM VINDO AO KOLISION!", 300, 200, 200, 'center')
		love.graphics.printf("PRESSIONE ENTER PARA COMEÇAR!", 300, 300, 200, 'center')
		love.graphics.printf("PRESSIONE ESC PARA SAIR", 300, 400, 200, 'center')
		if gameState == 'play' then
			love.graphics.clear(40/255, 45/255, 52/255, 255/255)
			love.graphics.setColor(255, 0, 0)
			love.graphics.circle("fill", circle.x, circle.y, 15)

			love.graphics.setColor(255, 255, 255)
			love.graphics.circle('fill', ball.x, ball.y, 15)
			love.graphics.setColor(255, 255, 255)
			love.graphics.printf("Mouse Coordinates: " .. mouse.x .. ", " .. mouse.y, 20, 20, 100, 'left')
		end	
	end
end



