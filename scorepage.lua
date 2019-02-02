local widget = require( "widget" ) 
local composer = require("composer" )
local scene = composer.newScene()

function scene:create( event )
xpos=display.contentCenterX
ypos=display.contentCenterY

local bg = display.newImage("scoresSCENE.jpg", xpos, ypos)
bg.rotation = 90
bg:scale(0.72, 0.9)

local shadow= display.newRect(xpos,802,1085,644)
shadow:setFillColor(0,0,0)
shadow.alpha = 0.5

start= display.newCircle( 130, 300, 95)--start
start:setFillColor(0,0,0)
start.alpha = 0.01
start:scale(1.2, 1)

--local savedScore = _G.points

-- Path for the file to write
local path = system.pathForFile( "scores.txt", "E:\Colors MidTerm" )
local myFile = io.open( path, "r" )


local wholefile = myFile:read( "*a" )
print( wholefile )

local readfrom
readfrom=display.newText( wholefile, xpos,802,  Arial, 150) -- display wholefile on screen
readfrom:setFillColor(1,1,1)
readfrom.rotation = 90

function startgame (event)-- Game Page
composer.gotoScene( "game", { effect = "fade", time = 2500 } )
end

start:addEventListener("tap", startgame)
end


function scene:hide( event )

end


---------------------------------------------------------------------------------
scene:addEventListener( "create", scene ) -- lets scene get loaded
scene:addEventListener( "show", scene ) -- holds vars and functions for this scene
scene:addEventListener( "hide", scene ) -- distroy scene objects and scene itself
---------------------------------------------------------------------------------
return scene