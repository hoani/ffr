// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


#macro WINDOW_SCALE 1

#macro STATE_TITLE 0
#macro STATE_SELECT 1
#macro STATE_FACEOFF 2
#macro STATE_COMBAT 3
#macro STATE_WINNER 4
#macro STATE_CONTINUE 5
#macro STATE_GAME_COMPLETE 6

function game_init(){
	if os_browser == browser_not_a_browser {
		window_set_size(room_width*WINDOW_SCALE, room_height*WINDOW_SCALE)
	}
	
	debug_init()
	gamespeed_init()
	global.state = new_state(STATE_TITLE)
	global.step = 0
	global.mono = 0
	global.singleplayer = true
	
	audio_init()
	
	random_set_seed(current_time)
	
	characters_init()
	player_init()
}

function gamestate() {
	return global.state.current	
}

function gamestate_set(_val) {
	state_set(global.state, _val)
	switch global.state.current {
		case STATE_COMBAT: 
			with(obj_combat) {
				f1 = new_fighter(global.p1)
				f2 = new_fighter(global.p2)
			}
		break;
	}
}

function gamestate_update() {
	state_update(global.state)	
}

function set_singleplayer() {
	global.singleplayer = true
	commands_register_single_player(global.cmd1)
}

function set_multiplayer() {
	global.singleplayer = false
	commands_register_player_one(global.cmd1)
	commands_register_player_two(global.cmd2)
}
