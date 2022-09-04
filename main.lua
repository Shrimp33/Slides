-- Load some deult values
function love.load()
	x, y, w, h = 0, 0, 1920, 1080
	love.window.setFullscreen(true)
	love.graphics.setBackgroundColor(1, 1, 1)
	linet = {{}}
	linenum = 1
	thickness = 5
	love.graphics.setColor(0, 0, 0)
	colorlist = {{"r", 1}}
	coli = 1
	love.graphics.setLineWidth(thickness)
end

-- Traverse the color list
function range(index)
	for i = 1, #colorlist do
		if i == #colorlist then
			return colorlist[#colorlist]
		elseif colorlist[i][2] >= index then
			return colorlist[i]
		end
	end
end

-- Set colors
function color(index)
	local c = range(index)[1]
	if c == "r" then
		love.graphics.setColor(1, .6, .6)
	elseif c == "b" then
		love.graphics.setColor(.6, .6, 1)
	elseif c == "g" then
		love.graphics.setColor(.6, 1, .6)
	end
end

--Draw
function love.draw()
	for i = 1, #linet do
		if #linet[i] > 4 then
			color(i)
			love.graphics.line(linet[i])
		end
	end
end
-- Update
function love.update(dt)
	if mouse == true then
		local x, y = love.mouse.getPosition()
		linet[linenum][#linet[linenum] + 1] = x
		linet[linenum][#linet[linenum] + 1] = y
	end
end

-- Mouse Updates
function love.mousepressed(x, y, button, istouch)
   if button == 1 then
      mouse = true
   end
end

function love.mousereleased(x, y, button)
   if button == 1 then
      mouse = false
	  linenum = linenum + 1
	  linet[linenum] = {}
   end
end

-- Clear and Colors
function love.keypressed(key, unicode)
	if unicode == "delete" then
		love.load()
	elseif unicode == "r" then
		colorlist[#colorlist + 1] = {"r", linenum}
	elseif unicode == "b" then
		colorlist[#colorlist + 1] = {"b", linenum}
	elseif unicode == "g" then
		colorlist[#colorlist + 1] = {"g", linenum}
	elseif unicode == left then
		linet[#linenum - 1] = {}
		linenum = linenum - 1
	end
end