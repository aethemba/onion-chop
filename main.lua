-----------------------------------------------------------------------------------------
--
-- main.lua
-- Onion Chop, copyright Aksel Ethembabaoglu
--
-----------------------------------------------------------------------------------------


-- local composer = require("composer")

-- local options = {
-- 	demo = "Bogus text" }

-- composer.gotoScene("openingcredits", options)

local storyboard = require("storyboard")
print "Loaded storyboard"

-- Global data table
local globaldata = require("globaldata")
globaldata.developer = "Aksel Ethem"

display.setStatusBar(display.HiddenStatusBar)
storyboard.gotoScene('openingcredits')
