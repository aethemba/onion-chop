local storyboard = require("storyboard")
local scene = storyboard.newScene()

local globaldata = require("globaldata")

local score = require("score")
local stimer = require("screen_timer")

print("Playscreen module loaded")

local centerX = display.contentCenterX
local centerY = display.contentCenterY

local timerText = stimer.init({
	fontSize = 40,
	font = "Helvetica",
	x = centerX,
	y = centerY - 100,
})

local scoreText = score.init({
	fontSize = 32,
	font = "Helvetica",
	x = centerX,
	y = centerY + 140,
	maxDigits = 3,
	leadingZeros = false,
	filename = "score.txt"
})

-- Forward references
local onTap
local edge = 0
local running = false
local starttext
local ready = false

-- function updateCounter( event )
-- 	local count = event.count
-- 	local remaining = totalTime - count

-- 	timerText.text = remaining
-- 	print (remaining)
-- 	if (remaining == 0) then
-- 		print "Done!"
-- 		--storyboard.reloadScene()
-- 		score.save()
-- 		storyboard.gotoScene("replay")
-- 		--storyboard.gotoScene("reloading", {time=250, effect="crossFade"})
-- 		--Restart scene
-- 	end

-- end

local function time_up_listener( event )
	print("Time up event received!")
	-- score.save()
	storyboard.gotoScene("replay")
end

function scene:createScene( event )
	local group = self.view
	local onion = display.newImage("chop.jpg", centerX, centerY)
	local prev_scene = storyboard.getPrevious()
	
	if (prev_scene == "replay") then
		storyboard.removeScene("replay")
	end

	onion:addEventListener("tap", onTap)

	local getReadyText = display.newText("Get ready!", centerX, centerY, "Helvetica", 32)
	local countDownText = display.newText("3", centerX, centerY + 50, "Helvetica", 30)
	local remaining = 3
	timer.performWithDelay(1000, 
		function()
			remaining = remaining - 1
			countDownText.text = remaining
			if (remaining == 0) then
				ready = true
				running = true
				transition.to(starttext, {alpha=0})
				stimer.countDown(5)
				transition.to(countDownText, {alpha=0})
				transition.to(getReadyText, {alpha=0})
			end
		end,

		3)

	Runtime:addEventListener("timeup", time_up_listener)

	group:insert( onion )
	group:insert( scoreText )
	group:insert( timerText )

end

function onTap( event )
	if (running == true) then
		if (event.x > edge) then
			score.add(1)
			edge = event.x
			local text = display.newText("Chop!", centerX, centerY, "Helvetica", 32)
			transition.to(text, {time=500, alpha=0})
		end
	end
end	

function scene:willEnterScene( event )
	local group = self.view
	score.set(0)
	edge = 0
	running = false
	starttext = display.newText("Ready, steady, chop!", centerX, centerY + 100, "Helvetica", 24)
	starttext:setTextColor(1, 1, 1)
	group:insert( starttext )

end

function scene:enterScene( event )
	local group = self.view

end

function scene:exitScene( event )
	local group = self.view

end

function scene:destroyScene( event )
	local group = self.view

end

scene:addEventListener("createScene", scene)
scene:addEventListener("willEnterScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene