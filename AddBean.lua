local widget = require("widget")
local sqlite = require("sqlite3")
local composer = require("composer")
local scene = composer.newScene()
local path, db, tableView 
local id, name, amt, food, Type
local TextField1, insert, search,TextField2,TextField3
local cx, cy, txtName, txtAmt, txtKcal, txtNum

cx = display.contentCenterX
cy = display.contentCenterY

local function buttonAdd(event)
    if(event.phase == "ended") then
        insertTableView()
        txtName.isVisible = false
        txtKcal.isVisible = false
        txtAmt.isVisible = false
        txtNum.isVisible = false
        TextField1.isVisible = false
        TextField2.isVisible = false
        TextField3.isVisible = false
        button.isVisible = false
        composer.gotoScene("tableBean")

        
        

    end
end



function insertTableView()
    local amt, kcal, name
        name = TextField1.text
        amt = TextField2.text
        kcal =TextField3.text
        ftype = "Bean"
    
        sql = "INSERT INTO food VALUES (" ..
        "NULL, '" ..
        name .. "', '" ..
        amt .. "', '" ..
        kcal .. "', '" ..
        ftype .. "');"

        db:exec(sql)
    
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
			composer.gotoScene("Diary")
		elseif (xStart < xEnd and swipeLength > 50) then 
			composer.gotoScene("test")
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

        path = system.pathForFile("foodDB.db",system.ResourceDirectory)
        db = sqlite.open(path)


        display.setDefault("background", 1, 1, 1)
        txtName = display.newText("ชื่ออาหาร", cx-105, 110, "Arial", 15)
txtName:setFillColor(0)
txtAmt = display.newText("ปริมาณอาหาร", cx-90, 160, "Arial", 15 )
txtAmt:setFillColor(0)
txtKcal = display.newText("ให้พลังงาน", cx-100, 210, "Arial", 15)
txtKcal:setFillColor(0)
txtNum = display.newText("Kcal", cx+130, 210, "Arial", 15)
txtNum:setFillColor(0)
TextField1 = native.newTextField(cx+30,110,150,30)
--TextField1.align ="center" 
TextField2 = native.newTextField(cx+30,160,150,30)
--TextField2.align ="center" 
TextField3 = native.newTextField(cx+30,210,150,30)
--TextField3.align ="center" 

        button = widget.newButton(
            {
                x = cx , y = 280,
                onEvent = buttonAdd,
                defaultFile = "floppy-disk.png"
            }
        )
 native.setKeyboardFocus(TextField)
    end
end

function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase
	if (phase == "will") then
		
		--Runtime:removeEventListener("touch", screenTouched)
		db:close()
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

