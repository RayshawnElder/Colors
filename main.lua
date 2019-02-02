local composer = require("composer")
display.setStatusBar("display.HiddenStatusBar")
composer.gotoScene( "start" )

local backgroundmusic = audio.loadStream( "starmusic.mp3 "  )
audio.play(backgroundmusic)