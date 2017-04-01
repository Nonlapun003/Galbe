local widget = require("widget")
local sqlite = require("sqlite3")
local composer = require("composer")
local scene = composer.newScene()
local path, db, tableView ,cx, cy
local id, name, amt, food, Type
local TextField, insert, search,titie
local txtMyfood, txtVegetable, txtKFC
local txtDonut, txtSubway, txtAuntie, txtFruit
local txtBean, txtEgg, txtNoodle, txtMilk, txtRice , txtMenu


cx = display.contentCenterX
cy = display.contentCenterY

function gotoMyfood(event)
    if(event.phase == "ended") then
    composer.gotoScene("test")
end
end

function gotoVegetable(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableVegetable")
end
end
function gotoKFC(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableKFC")
end
end

function gotoDonut(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableDonut")
end
end

function gotoSubway(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableSubway")
end
end

function gotoAuntie(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableAuntie")
end
end

function gotoFruit(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableFruit")
end
end

function gotoBean(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableBean")
end
end

function gotoEgg(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableEgg")
end
end

function gotoNoodle(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableNoodle")
end
end

function gotoMilk(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableMilk")
end
end

function gotoRice(event)
    if(event.phase == "ended") then
    composer.gotoScene("tableRice")
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
			composer.gotoScene("test")
		elseif (xStart < xEnd and swipeLength > 50) then 
			composer.gotoScene("Diary")
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
						labelColor = { default={0, 0, 0, 1}},
						fillColor = { default={255/255,160/255,122/255, 1} }
					
					}
				)
			display.setDefault("background",255,255,255)

			Myfood = widget.newButton(
				{
					x = cx-100 , y = 90,
					onEvent = gotoMyfood,
					defaultFile = "salty.png"
				}
			)
			Myfood:scale(0.7,0.7)

			Vegetable = widget.newButton(
				{
					x = cx , y = 90,
					onEvent = gotoVegetable,
					defaultFile = "cabbage.png"
				}
			)
			Vegetable:scale(0.8,0.8)

			Kfc = widget.newButton(
				{
					x = cx+100 , y = 90,
					onEvent = gotoKFC,
					defaultFile = "fried-chicken.png"
				}
			)
			Kfc:scale(0.8,0.8)

			Donut = widget.newButton(
				{
					x = cx-100 , y = 210,
					onEvent = gotoDonut,
					defaultFile = "donut.png"
				}
			)
			Donut:scale(0.8,0.8)

			Subway = widget.newButton(
				{
					x = cx , y = 210,
					onEvent = gotoSubway,
					defaultFile = "burger.png"
				}
			)
			Subway:scale(0.8,0.8)

			Auntie = widget.newButton(
				{
					x = cx+100 , y = 210,
					onEvent = gotoAuntie,
					defaultFile = "pretzel.png"
				}
			)
			Auntie:scale(0.8,0.8)

			Fruit = widget.newButton(
				{
					x = cx-100 , y = 330,
					onEvent = gotoFruit,
					defaultFile = "watermelon.png"
				}
			)
			Fruit:scale(0.8,0.8)

			Bean = widget.newButton(
				{
					x = cx , y = 330,
					onEvent = gotoBean,
					defaultFile = "beans.png"
				}
			)
			Bean:scale(0.8,0.8)

			Egg = widget.newButton(
				{
					x = cx+100 , y = 330,
					onEvent = gotoEgg,
					defaultFile = "easter-egg.png"
				}
			)
			Egg:scale(0.8,0.8)

			Noodle = widget.newButton(
				{
					x = cx-100 , y = 450,
					onEvent = gotoNoodle,
					defaultFile = "noodles.png"
				}
			)
			Noodle:scale(0.8,0.8)

			Milk = widget.newButton(
				{
					x = cx , y = 450,
					onEvent = gotoMilk,
					defaultFile = "milk.png"
				}
			)
			Milk:scale(0.8,0.8)

			Rice = widget.newButton(
				{
					x = cx+100 , y = 450,
					onEvent = gotoRice,
					defaultFile = "rice.png"
				}
			)
			Rice:scale(0.8,0.8)


txtMyfood = display.newText("อาหารของฉัน", cx-100, 135, "Arial", 16 )
txtMyfood:setFillColor(0)
txtVegetable = display.newText("ผัก", cx, 135, "Arial", 16 )
txtVegetable:setFillColor(0)
txtKFC = display.newText("KFC", cx+100, 135, "Arial", 16 )
txtKFC:setFillColor(0)
txtDonut = display.newText("Krispy crimp", cx-100, 255, "Arial", 16 )
txtDonut:setFillColor(0)
txtSubway = display.newText("Subway", cx, 255, "Arial", 16 )
txtSubway:setFillColor(0)
txtAuntie = display.newText("Auntie ann's", cx+100, 255, "Arial", 16 )
txtAuntie:setFillColor(0)
txtFruit = display.newText("ผลไม้", cx-100, 380, "Arial", 16 )
txtFruit:setFillColor(0)
txtBean = display.newText("ถั่ว", cx, 380, "Arial", 16 )
txtBean:setFillColor(0)
txtEgg = display.newText("เมนูไข่", cx+100, 380, "Arial", 16 )
txtEgg:setFillColor(0)
txtNoodle = display.newText("เมนูเส้น", cx-100, 493, "Arial", 16 )
txtNoodle:setFillColor(0)
txtMilk = display.newText("นม", cx, 493, "Arial", 16 )
txtMilk:setFillColor(0)
txtRice = display.newText("ข้าว", cx+100, 493, "Arial", 16 )
txtRice:setFillColor(0)
txtMenu = display.newText("ประเภทของอาหาร", cx, 30, "Arial", 18 )
txtMenu:setFillColor(0)

end
end

function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase
	if (phase == "will") then
		
		menu:removeSelf()
		Myfood:removeSelf()
		Auntie:removeSelf()
		Vegetable:removeSelf()
		Kfc:removeSelf()
		Donut:removeSelf()
		Subway:removeSelf()
		Fruit:removeSelf()
		Bean:removeSelf()
		Egg:removeSelf()
		Noodle:removeSelf()
		Milk:removeSelf()
		Rice:removeSelf()
		txtKFC:removeSelf()
		txtMyfood:removeSelf()
		txtVegetable:removeSelf()
		txtDonut:removeSelf()
		txtSubway:removeSelf()
		txtAuntie:removeSelf()
		txtFruit:removeSelf()
		txtBean:removeSelf()
		txtEgg:removeSelf()
		txtNoodle:removeSelf()
		txtMilk:removeSelf()
		txtRice:removeSelf()
		txtMenu:removeSelf()

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
