local storyboard = require("storyboard")
local scene = storyboard.newScene()

local globaldata = require("globaldata")

local score = require("score")

local centerX = display.contentCenterX
local centerY = display.contentCenterY

local scoreText = score.init({
	fontSize = 20,
	font = "Helvetica",
	x = centerX,
	y = centerY + 150,
	maxDigits = 3,
	leadingZeros = false,
	filename = "score.txt"
})


local onTap
local countText
local edge = 0
local running = false
local starttext
local timeText
local totalTime = 5
local timerText


function updateCounter( event )
	local count = event.count
	local remaining = totalTime - count

	timerText.text = remaining
	print (remaining)
	if remaining == 0 then
		print "Done!"
		storyboard.reloadScene()
		--storyboard.gotoScene("reloading", {time=250, effect="crossFade"})
		--Restart scene
	end

end

function scene:createScene( event )
	local group = self.view
	timeText = ""..totalTime
	timerText = display.newText(timeText, centerX, centerY - 100, "Helvetica", 40)

	local onion = display.newImage("chop.jpg", centerX, centerY)
	onion:addEventListener("tap", onTap)
	group:insert( onion )
	group:insert( scoreText )
end

function onTap( event )
	if running == false then
		running = true
		transition.to(starttext, {alpha=0})
		timer.performWithDelay(1000, updateCounter, totalTime)
	end

	if event.x > edge then
		score.add(1)
		edge = event.x
		local text = display.newText("Chop!", centerX, centerY, "Helvetica", 32)
		transition.to(text, {time=500, alpha=0})
	end
end	

function scene:willEnterScene( event )
	local group = self.view

	score.set(0)
	edge = 0
	running = false
	timerText.text = timeText
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