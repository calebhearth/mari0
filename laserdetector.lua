laserdetector = class:new()

function laserdetector:init(x, y, dir)
	self.cox = x
	self.coy = y
	self.dir = dir
	
	self.drawable = false
	
	self.outtable = {}
	self.allowclear = true
end

function laserdetector:update(dt)
	self.allowclear = true
end

function laserdetector:input(t)
	self.allowclear = false
	if t == "on" then
		for i = 1, #self.outtable do
			if self.outtable[i].input then
				self.outtable[i]:input("on")
			end
		end
	end
end

function laserdetector:draw()
	local rot = 0
	if self.dir == "down" then
		rot = math.pi/2
	elseif self.dir == "left" then
		rot = math.pi
	elseif self.dir == "up" then
		rot = math.pi*1.5
	end
	love.graphics.draw(laserdetectorimg, math.floor((self.cox-xscroll-0.5)*16*scale), (self.coy-1)*16*scale, rot, scale, scale, 8, 8)
end

function laserdetector:addoutput(a)
	table.insert(self.outtable, a)
end

function laserdetector:clear()
	if self.allowclear then
		self.allowclear = false
		for i = 1, #self.outtable do
			if self.outtable[i].input then
				self.outtable[i]:input("off")
			end
		end
	end
end