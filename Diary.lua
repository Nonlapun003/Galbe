local widget = require("widget")
local composer = require("composer")
local scene = composer.newScene()
local cx = display.contentCenterX




button = widget.newButton(
	{
		x = cx+80 , y = 70,
		onEvent = buttonSearch,
		defaultFile = "search.png"
	}
)


local function screenTouched(event)
	local phase = event.phase
	local xStart = event.xStart
	local xEnd = event.x
	local swipeLength = math.abs(xEnd - xStart) 
	if (phase == "began") then
		return true
	elseif (phase == "ended" or phase == "cancelled") then
		if (xStart > xEnd and swipeLength > 50) then 
			composer.gotoScene("MainFood")
		elseif (xStart < xEnd and swipeLength > 50) then 
			composer.gotoScene("main")
		end 
	end	
end

function scene:create(event)
	local sceneGroup = self.view
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if (phase == "will") then
		display.setDefault("background", 77 / 255, 86 / 255, 86 / 255)
		

		button = widget.newButton(
	{
		x = cx+80 , y = 70,
		onEvent = buttonSearch,
		defaultFile = "search.png"
	}
)

	elseif (phase == "did") then
		button = widget.newButton(
	{
		x = cx+80 , y = 70,
		onEvent = buttonSearch,
		defaultFile = "search.png"
	}
)
	end
end

function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase
	if (phase == "will") then
		--titleText:removeSelf()
		--titleText = nil
		scrollView:removeSelf()
		scrollView = nil
		Runtime:removeEventListener("touch", screenTouched)
	elseif (phase == "did") then
	end
end

function scene:destroy(event)
	local sceneGroup = self.view
end



scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene