local storyboard = require("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")

local globaldata = require("globaldata")

local score = require("score")

local centerX = display.contentCenterX
local centerY = display.contentCenterY


local restarttext

function scene:createScene( event )
	local group = self.view
	storyboard.removeScene("playscreen")

	local onion = display.newImage("chop.jpg", centerX, centerY)
	group:insert( onion )

	restarttext = display.newText("Game over, great job!", centerX, centerY -50 , "Helvetica", 24)
	restarttext:setTextColor(1, 1, 1)
	endscore = display.newText("Your score: " ..score.get(), centerX, centerY, "Helvetica", 28)
	group:insert( restarttext )
	group:insert( endscore )

	print ("Score ", score.get())

	local function loadplayscreen( event )
		storyboard.gotoScene( "playscreen" )
	end

	local restartButton = widget.newButton{
		left = 150,
		top = 200,
		width = 150,
		height = 50,
		label = "Play again",
		onEvent = loadplayscreen
	 }

	 group:insert( restartButton )
end


function scene:willEnterScene( event )
	local group = self.view
	-- score.load()
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