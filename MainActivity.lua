local widget = require("widget")
local sqlite = require("sqlite3")
local composer = require("composer")
local scene = composer.newScene()
local path, db, tableView ,cx, cy
local id, name, amt, food, Type
local TextField, insert, search,titie, txtMyfoodee, txtVegetableee


cx = display.contentCenterX
cy = display.contentCenterY





function goTOmyactivity(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableActivity")
end
end

--[[function goToallActivity(event)
    if(event.phase == "ended") then
    composer.gotoScene("AllActivity")
end
end]]


local function screenTouched(event)
	local phase = event.phase
	local xStart = event.xStart
	local xEnd = event.x
	local swipeLength = math.abs(xEnd - xStart) 
	print("screen touch")
	if (phase == "began") then
		return true
	elseif (phase == "ended" or phase == "cancelled") then
		if (xStart > xEnd and swipeLength > 50) then 
			composer.gotoScene("tableActivity")
		elseif (xStart < xEnd and swipeLength > 50) then 
			composer.gotoScene("DiaryAvtivity")
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


menu = widget.newButton( {
			left = display.contentCenterX-159,
			top = cy-285,
			width = 320,
			height= 52,
			shape = "Rectangle",
			label = "Galbé Diary",
			labelColor = { default={0, 0, 0, 1},},
			fillColor = { default={70/255,130/255,170/255, 1} }
		
		}
	)
display.setDefault("background",255,255,255)

MyActivity= widget.newButton(
	{
		x = cx , y = 130,
		onEvent = goTOmyactivity,
		defaultFile = "tennis.png"
	}
)
--Myfood:scale(0.7,0.7)

--[[Allactivity= widget.newButton(
	{
		x = cx+60 , y = 90,
		onEvent = goToallActivity,
		defaultFile = "football.png"
	}
)]]
--Vegetable:scale(0.8,0.8)




 txtMyfoodee = display.newText("กิจกรรมทั้งหมด", cx, 185, "Arial", 16 )
txtMyfoodee:setFillColor(0)

 --[[txtVegetableee = display.newText("กิจกรรมทั้งหมด", cx+60, 135, "Arial", 16 )
txtVegetableee:setFillColor(0)]]
--local txtKFC = display.newText("KFC", cx+100, 135, "Arial", 16 )
--txtKFC:setFillColor(0)
txtMyfoodee.isVisible = true
end
end

function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase
	if (phase == "will") then
		
		menu:removeSelf()

		--Allactivity:removeSelf()
		MyActivity:removeSelf()

		txtMyfoodee:removeSelf()
		--txtVegetableee:removeSelf()
		--txtMyfoodee.isVisible = false
		
		
		--Runtime:removeEventListener("touch", screenTouched)
		--db:close()
	elseif (phase == "did") then
		--txtMyfoodee.isVisible = false

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
