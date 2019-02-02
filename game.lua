local widget = require( "widget" ) 
local composer = require("composer" ) 
local scene = composer.newScene() 


function scene:create(event)
math.randomseed( os.time())

local xpos=display.contentCenterX
local ypos=display.contentCenterY

local sec1= display.newRect(xpos,80,1085,480)
sec1:setFillColor(1,0,0) -- red
local sec2= display.newRect(xpos,481,1085,321)
sec2:setFillColor(0.62,0.98,0.1) --lime green
local sec3= display.newRect(xpos,802,1085,321)
sec3:setFillColor(0,0,1) -- blue
local sec4= display.newRect(xpos,1123,1085,321)
sec4:setFillColor(0.65,0,0.90) -- purple
local sec5= display.newRect(xpos,1444,1085,321)
sec5:setFillColor(0.90,0.45,0.05) --orange
local sec6= display.newRect(xpos,1765,1085,321) -- 1933 end
sec6:setFillColor(0.1,1,0.90) -- light blue
------------------------------------------------------------------------------------------------------------------------
local color = {{0.1,1,0.90}, {0.90,0.45,0.05},  {1,0,0},
	{0.62,0.98,0.1}, {0,0,1},  {0.65,0,0.90}} -- color table

local points = 0
score=display.newText("Score: 0", 32, 145,  Arial, 75)
score:setFillColor(1,1,1)
score.rotation = 90

local Challenge = 4500
local WRange = math.random(50,1000)

circleSV = display.newCircle( WRange, -100, 60, 60 )
circleSV:setFillColor (1,1,1)

local circle = display.newCircle( WRange, -100, 50, 50 )
circle.color = math.random(1,6)
circle:setFillColor(unpack(color[circle.color]))
ballcolor = (unpack(color[circle.color]))
print (unpack(color[circle.color]))
------------------------------------------------------------------------------------------------------------------------
	local function dispCircle()
		local circle = display.newCircle( WRange, -100, 50, 50 )
		circle.color = math.random(1,6)
		circle:setFillColor(unpack(color[circle.color]))
		ballcolor = (unpack(color[circle.color]))
		print (unpack(color[circle.color])) -- should get color to line up with rects
	end
			


			
	local function roundtran (event)
		transition.to( circleSV, {time =Challenge, y=1999, transition=easing.linear})
		transition.to( circle, {time =Challenge, y=1999, transition=easing.linear,  onComplete = backto} )
	end
------ENDLESS CYCLE
	function backto (event)
		transition.to( circleSV, {time =Challenge, y=-100, transition=easing.linear })
		transition.to( circle, {time = Challenge, y=-100, transition=easing.linear, onComplete = roundtran})
	end

	local function getposition (event)
	
	if (points == 2) then
		Challenge = Challenge / 1.5
		else if (points > 4) then
		Challenge = Challenge / 2.85
		end
	end	
	
		if circle ~= nil then
			bounds = circle.contentBounds 
			print(bounds.yMin )
		end
	end
			
	local function ScoreF(event)
	
		local color = {{0.1,1,0.90},{0.90,0.45,0.05},{1,0,0},
					   {0.62,0.98,0.1},{0,0,1},{0.65,0,0.90}}
					   
			--score validation
			if ((bounds.yMin <= 322) and (ballcolor == color[3])) then 
			points = points + 1
			score.text=("Score:"..points)
			circle:removeSelf()
			circleSV:removeSelf()
			circle = nil				
			timer.performWithDelay(100, dispCircle, 1) --red
			_G.points = points	
			
			elseif ((bounds.yMin <= 644) and (bounds.yMin > 323) and (ballcolor == color[4])) then
			points = points + 1
			score.text=("Score:"..points)
			circle:removeSelf()
			circleSV:removeSelf()
			circle = nil				
			timer.performWithDelay(100, dispCircle, 1)--limeGreen
			_G.points = points 
			
			elseif ((bounds.yMin <= 966) and (bounds.yMin > 644) and (ballcolor == color[5])) then
			points = points + 1
			score.text=("Score:"..points)
			circle:removeSelf()
			circleSV:removeSelf()
			circle = nil				
			timer.performWithDelay(100, dispCircle, 1)--blue
			_G.points = points 
			
			elseif ((bounds.yMin <= 1288) and (bounds.yMin > 967) and (ballcolor == color[6])) then
			points = points + 1 
			score.text=("Score:"..points)
			circle:removeSelf()
			circleSV:removeSelf()
			circle = nil				
			timer.performWithDelay(100, dispCircle, 1)-- purple
			_G.points = points 
			
			elseif ((bounds.yMin <= 1610) and (bounds.yMin > 1289) and ballcolor == color[2]) then
			points = points + 1
			score.text=("Score:"..points)
			circle:removeSelf()
			circleSV:removeSelf()
			circle = nil				
			timer.performWithDelay(100, dispCircle, 1)
			_G.points = points -- orange
			
			elseif ((bounds.yMin >= 1611) and (ballcolor == color[1])) then
			points = points + 1
			score.text=("Score:"..points)
			circle:removeSelf()
			circleSV:removeSelf()
			circle = nil				
			timer.performWithDelay(100, dispCircle, 1)-- lightblue
			_G.points = points 
			
			else
			points = points - 1
			score.text=("Score:"..points)
			circle:removeSelf()
			circleSV:removeSelf()
			circle = nil	
			circleSV = nil			
			_G.points = points
			
			local points = 0
			gamestate=display.newText("Game Over", 500, 915,  Arial, 245)
			gamestate:setFillColor(1,1,1)
			gamestate.rotation = 90
			print("Game Over") -- Fail case
		end
	end

timer.performWithDelay(1, roundtran, 1)
timer.performWithDelay(1, getposition, -1)
circle:addEventListener("tap", ScoreF)
end


function scene:hide( event )
    if ( event.phase == "will" ) then
        --game:removeSelf()
        composer.removeScene( "game" )
    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "show", scene )

return scene