local M = {}

M.remaining = nil
local obj = {}

function M.init( options )
	local customOptions = options or {}
	local opt = {}

	opt.fontSize = customOptions.fontSize or 24
	opt.font = customOptions.font or native.systemFontBold
	opt.x = customOptions.x or display.contentCenterX
	opt.y = customOptions.y or display.contentCenterY	
	opt.startCount = customOptions.startcount or 5
	M.remaining = opt.startCount
	M.timerText = display.newText(M.remaining, opt.x, opt.y, opt.font, opt.fontSize)
	return M.timerText
end


function M.updateCount()
	M.remaining = M.remaining - 1
	M.timerText.text = string.format(M.remaining)

	if (M.remaining == 0) then
		print ("Time up!")

		local event = {
			name = "timeup",
		}

		Runtime:dispatchEvent( event )

		transition.to(M.timerText, {time=500, alpha=0})
	end

	
end

function M.countDown()
	timer.performWithDelay(1000, M.updateCount, M.remaining)
end

return M