// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gamespeed_init(){
	global.s = 1.0
}

function get_spd(_base){
	return global.s*_base
}

function accelerate(_base, _accel){
	return _base + global.s * _accel
}

function apply_spd() {
	hspeed = get_spd(hspd)
	vspeed = get_spd(vspd)
}

function pause_toggle() {
	if gamestate() == STATE_PAUSE {
		resume_game()
	} else {
		pause_game()
	}
}

function pause_game(){
	if gamestate() != STATE_PLAY {
		return
	}
	gamestate_set(STATE_PAUSE)
	global.s = 0.0
	sfx_pause()
}

function resume_game() {
	if gamestate() != STATE_PAUSE {
		return
	}
	gamestate_set(STATE_PLAY)
	global.s = 1.0
	sfx_resume()
}


