local composer = require("composer")
local scene = composer.newScene()

----------
-- All code outside of the listener functions will onyl be executed once
-- unless "composer.newScene()" is called
----------

---- Local forward references here

----------

-- "scene:create()"

function scene:create( event )

	local sceneGroup = self.view

	--- Init scene here
	--- Example: add display objects to "sceneGroup", add touch listeners, etc

end


function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == 'will') then
		-- Call when the scene is off screen but is about to show
	elseif (phase == 'did') then
		--- Called when scene is on screen
		--- Insert code to make scene come to live
		--- Example: start times, begin animation, play audio etc
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if (phase == 'will') then
	elseif (phase == "did" ) then
		---
	end
end

function scene:destroy( event )

	local sceneGroup = self.view

	-- Called prior to the removal of the scene's view
	-- Insert code to cleanup scene
end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene




