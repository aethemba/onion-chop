local storyboard = require("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")

local globaldata = require("globaldata")
local loadplayscreen

local centerX = display.contentCenterX
local centerY = display.contentCenterY


function scene:createScene( event )
	local group = self.view

	local background = display.newImage("onion_bkg.jpg", 250, 150)
	local title = display.newText("Welcome to Onion Chop!", centerX, centerY, "Helvetica", 24)
	title:setFillColor(0, 0, 0)

	group:insert( background )
	group:insert( title )

	local function loadplayscreen( event )
		print ("Click the startbutton")
		storyboard.gotoScene("playscreen")	
	end

	local startButton = widget.newButton{
		left = 150,
		top = 200,
		width = 150,
		height = 50,
		label = "Start game",
		onEvent = loadplayscreen
	}

	group:insert( startButton )
end



function scene:willEnterScene( event )
	local group = self.view

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

