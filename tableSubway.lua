local widget = require("widget")
local sqlite = require("sqlite3")
local composer = require("composer")
local scene = composer.newScene()
local path, db, tableView ,cx, cy
local id, name, amt, food, Type
local TextField, insert, search,titie


cx = display.contentCenterX
cy = display.contentCenterY

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
			composer.gotoScene("Mainfood")
		end 
	end	
end

function scene:create(event)
	local sceneGroup = self.view
end

local function categoryListener(event)
    print(event.x)
    if (event.phase == "ended") then
        view = view % 3 + 1
        createTableView()
    end
end

local function buttonSearch(event)
    if(event.phase == "ended") then
        
            createTableView()
        
    end
end

function buttonAddBean(event)
    if(event.phase == "ended") then
    composer.gotoScene("AddSubway")
end
end


local function rowTouch(event)    
  --  if (event.phase == "swipeLeft") then
	--	composer.gotoScene("scene3")
   -- elseif (event.phase == "swipeRight") then
	--	composer.gotoScene("scene1")
   -- end

    local row = event.row.index
    local word
    if(event.phase == "release") then
        words = {"ยกเลิก"}
        for word in namewb[row]:gmatch("%S+") do
            table.insert(words,word)
        end
    alert = native.showAlert("กรองคำค้นหาด้วยคำ", "เลือกคำที่กรอง", words, showAlertListener)
    end
end

local function rowRender(event)
    local row, rowHeight, rowWidth, rowTitle1, rowTitle2, fontSize
    local rowString1, rowString2
    row = event.row
    fontSize = 18
    rowHeight =row.contentHeight
    rowWidth = row.contentWidth
    if (row.index == 1) then
        rowTitle1 = display.newText(row, "รายการอาหาร                      หน่วย(KCAL)",0, 0, "Quark-Bold.otf", fontSize)
        rowTitle1:setFillColor(0)
        rowTitle1.x = display.contentCenterX
        rowTitle1.y = rowHeight * 0.5
    return
end
rowString1 = string.format("%3d.", id[row.index])  .. " "..name[row.index] .."("..amt[row.index]..")"
rowString2 = string.format("%3d" , kcal[row.index])
rowTitle1 = display.newText(row , rowString1,0,0, "Quark-Bold.otf", fontSize-3)
rowTitle1:setFillColor(0)
rowTitle1.anchorX = 0
rowTitle1.x = 10
rowTitle1.y = rowHeight * 0.5
myRectangle = display.newRect(row, rowWidth-65, rowHeight* 0.47, 84, 39)
myRectangle.strokeWidth = 1
myRectangle:setFillColor(250/255, 128/255, 114/255)
myRectangle:setStrokeColor(0.5,0.5,0.5)      
myRectangle.alpha = 1
myRectangle.anchorX = 0
rowTitle2 = display.newText(row,rowString2, 0 ,0, "Quark-Bold,otf", fontSize -3)
rowTitle2:setFillColor(0,0,0)
rowTitle2.anchorX =1
rowTitle2.x = rowWidth-5
rowTitle2.y = rowHeight *0.55
end


function createTableView(filter)
    local sqlCommand, sqlFilter, nameNoWB
    sqlFilter = TextField.text
    tableView:deleteAllRows()

    id = {""}
    name = {""}
    amt = {""}
    kcal = {""}
    Type = {""}
    tableView:insertRow(
        {
            isCategory = true, rowHeight = 30,
            rowColor = {default = {0.5,0.5,0.5,0.95}}
        }
    )
    c = 0
    for row in db:nrows("SELECT * FROM food  WHERE type = 'Subway' and name LIKE \"%" .. sqlFilter.. "%\" ORDER BY name;") do
    c = c + 1
    table.insert(id,c)
    table.insert(name,row.name)
    table.insert(amt, row.amt)
    table.insert(kcal, row.kcal)
    table.insert(Type, row.Type)
    tableView:insertRow(
        {
            isCategory = false, rowHeight = 40,
            rowColor = {default = {1,1,1},over = {1,0.7,0.5}},
        }
    )
 end  
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if (phase == "will") then

        path = system.pathForFile("foodDB.db",system.ResourceDirectory)
        db = sqlite.open(path)
        display.setDefault("background",219/255,112/255,147/255)
        display.setStatusBar(display.HiddenStatusBar)

        tableView = widget.newTableView{
        left = 0, top = 95,
        height = display.contentHeight,
        width = display.contentWidth,
        onRowRender = rowRender,
        onRowTouch = rowTouch

        }






button = widget.newButton(
    {
        x = cx+80 , y = 70,
        onEvent = buttonSearch,
        defaultFile = "search.png"
    }
)

button2 = widget.newButton(
    {
        x = cx+130 , y = 70,
        onEvent = buttonAddBean,
        defaultFile = "plus.png"
    }
)

buttonFood = widget.newButton( {
            left = display.contentCenterX -157,
            top = 10,
            width = 159,
            height= 35,
            shape = "Rectangle",
            label = "อาหารในวันนี้",
            id = "button1",
            labelColor = { default={0, 0, 0, 1}, over={1, 1, 1, 1} },
            fillColor = { default={250/255, 128/255, 114/255, 1}, over={255/255, 127/255, 80/255, 1} },
            onEvent = clickButton
        }
    )

buttonTable = widget.newButton( {
            left = display.contentCenterX+5,
            top = 10,
            width = 159,
            height= 35,
            shape = "Rectangle",
            label = "ตารางอาหาร",
            id = "button2",
            labelColor = { default={0, 0, 0, 1}, over={1, 1, 1, 1} },
            fillColor = { default={250/255, 128/255, 114/255, 1}, over={255/255, 127/255, 80/255, 1} },
            onEvent = clickButton
        }
    )


TextField = native.newTextField(cx-50,70,210,40)
TextField.align ="center" 
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

		view = 1
		sceneGroup:insert(tableView)
		createTableView()
        native.setKeyboardFocus(TextField)

	elseif (phase == "did") then
		--Runtime:addEventListener("touch", screenTouched)
	end
end

function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase
	if (phase == "will") then
		tableView:removeSelf()
		tableView = nil
		--Runtime:removeEventListener("touch", screenTouched)
        TextField:removeSelf()
        button:removeSelf()
        button2:removeSelf()
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

