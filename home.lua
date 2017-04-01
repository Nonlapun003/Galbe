local widget = require("widget")
local composer = require("composer")
local composer = require("composer")
local scene = composer.newScene()
local path, db, tableView ,cx, cy
local id, name, amt, food, Type
local TextField, insert, search,titie, txtMyfoodee, txtVegetableee
local myRectangle2, myRectangle, Galby, txtMainFood, txtMainActivity




local cx = display.contentCenterX
local cy = display.contentCenterY

function goTOMainactivity(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableActivity")
end
end

function gotoMainfood(event)
    if(event.phase == "ended") then
    composer.gotoScene("MainFood")
end
end

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
			composer.gotoScene("MainActivity")
		elseif (xStart < xEnd and swipeLength > 50) then 
			composer.gotoScene("MainFood")
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
display.setDefault("background",1,0.941,0.96)




myRectangle = display.newRect( 160, -10, 325, 80 )
--myRectangle.strokeWidth = 10
myRectangle:setFillColor( 1, 0.71, 0.75 )
myRectangle:setStrokeColor( 0, 0, 0 )

Myfood = widget.newButton(
	{
		x = cx , y = 170,
		onEvent = gotoMainfood,
		defaultFile = "salty.png"
	}
)

MyActivity= widget.newButton(
	{
		x = cx , y = 300,
		onEvent = goTOMainactivity,
		defaultFile = "tennis.png"
	}
)

menu = widget.newButton(
		    {
		        x = 25, y = 0,
		        onEvent = buttonEvent,
		        defaultFile = "/icon/menu.png",
		       	width = 50,
                height = 50
		    }
		    
		)
menu:scale(0.7,0.7)

Galby = display.newText("Galbe Diary" ,160 ,0 , "Arial" ,25)
Galby:setFillColor(0)


txtMainActivity = display.newText("ตารางกิจกรรม" ,cx ,355 , "Arial" ,17)
txtMainActivity:setFillColor(0)
txtMainFood = display.newText("ตารางอาหาร" ,cx ,220 , "Arial" ,17)
txtMainFood:setFillColor(0)


dateTime = widget.newButton(
		    {
		        x = 300, y = 0,
		        onEvent = buttonEvent,
		        defaultFile = "/icon/dateTime.png",
		       	width = 30,
                height = 30
		    }
		    
		)
dateTime:scale(0.7,0.7)

myRectangle2 = display.newRect( 160 , 50 , 325 , 50)
myRectangle2:setFillColor(1, 0.41, 0.705)
myRectangle2:setStrokeColor(0,0,0)


statistic = widget.newButton(
		    {
		        x = 40, y = 50,
		        onEvent = buttonEvent,
		        defaultFile = "/icon/statistic.png",
		       	width = 30,
                height = 30
		    }
		    
		)
statistic:scale(0.7,0.7)


barcode = widget.newButton(
		    {
		        x = 160, y = 50,
		        onEvent = buttonEvent,
		        defaultFile = "/icon/barcode.png",
		       	width = 30,
                height = 30
		    }
		    
		)



news = widget.newButton(
		    {
		        x = 275, y = 50,
		        onEvent = buttonEvent,
		        defaultFile = "/icon/news.png",
		       	width = 30,
                height = 30
		    }
		    
		)
news:scale(0.7,0.7)

end
end

function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase
	if (phase == "will") then
		
		myRectangle2.isVisible = false

		myRectangle.isVisible = false
		menu:removeSelf()

		Galby:removeSelf()
		news:removeSelf()
		Galby.isVisible = false
		barcode:removeSelf()
		statistic:removeSelf()
		dateTime:removeSelf()
		Myfood:removeSelf()
		MyActivity:removeSelf()
		txtMainActivity.isVisible = false
		txtMainFood.isVisible = false
		
		
		
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

