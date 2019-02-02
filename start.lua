local widget = require( "widget" ) 
local composer = require("composer" ) 
local scene = composer.newScene() 

local scorelist, start, bg, xpos, ypos

function scene:create( event )

local sceneGroup = self.view
xpos=display.contentCenterX
ypos=display.contentCenterY

bg = display.newImage("startscreen.jpg", xpos, ypos)
bg.rotation = 90
bg:scale(0.72, 0.9)

start= display.newCircle( 130, 300, 95)--start
start:setFillColor(0,0,0)
start.alpha = 0.01
start:scale(1.2, 1)

scorelist= display.newCircle( 140, 1600, 95)--scores
scorelist:setFillColor(0,0,0)
scorelist.alpha = 0.01
scorelist:scale(1.2, 1)

function startgame (event)-- Game Page
composer.gotoScene( "game", { effect = "fade", time = 2500 } )
end

function listofscores (event)-- Score Page
composer.gotoScene( "scorepage", { effect = "fade", time = 2500 } )
end

start:addEventListener("tap", startgame)
scorelist:addEventListener("tap", listofscores)
end 

function scene:hide( event )
    if ( event.phase == "will" ) then
        bg:removeSelf()
		scorelist:removeSelf() -- self remove score invis button
        composer.removeScene( "start" )
    end
end
---------------------------------------------------------------------------------
scene:addEventListener( "create", scene ) -- lets scene get loaded
scene:addEventListener( "show", scene ) -- holds vars and functions for this scene
scene:addEventListener( "hide", scene ) -- distroy scene objects and scene itself
---------------------------------------------------------------------------------
return scene