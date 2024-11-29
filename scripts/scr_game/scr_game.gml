// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


#macro WINDOW_SCALE 1

#macro STATE_CUTSCENE 0
#macro STATE_PLAY 1
#macro STATE_PAUSE 2


function game_init(){
	if os_browser == browser_not_a_browser {
		window_set_size(room_width*WINDOW_SCALE, room_height*WINDOW_SCALE)
	}
	
	debug_init()
	gamespeed_init()
	global.state = new_state(STATE_CUTSCENE)
	global.step = 0
	global.mono = 0
	
	audio_init()
}
