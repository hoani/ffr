// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function sfx_init() {
	global.sfx={
		enabled: true,
		gain: 0.5,
	}
}

function create_sfx(_x, _y, _snd, _gain) {
	instance_create_depth(_x, _y, 0, obj_sfx, {snd: _snd, gain: _gain})
}

function new_sfx(){
	var _sfx = audio_emitter_create()
	return _sfx
}

function sfx_gain(_sfx, _gain) {
	audio_emitter_gain(_sfx, _gain)
}

function sfx_play(_sfx, _snd) {
	if global.sfx.enabled {
		return audio_play_sound_on(_sfx, _snd, false, 2.5)
	}
	return -1
}

function sfx_loop(_sfx, _snd) {
		return audio_play_sound_on(_sfx, _snd, true, 2.5)
}

function sfx_play_gain(_sfx, _snd, _gain) {
	if global.sfx.enabled {
		return audio_play_sound_on(_sfx, _snd, false, 2.5, _gain)
	}
	return -1
}

function sfx_loop_gain(_sfx, _snd, _gain) {
	return audio_play_sound_on(_sfx, _snd, true, 2.5, _gain)
}


function sfx_update(_sfx, _x, _y) {
	audio_emitter_position(_sfx, room_width/2 - _x, room_height/2 - _y, 0)	
}

function sfx_cleanup(_sfx) {
	audio_emitter_free(_sfx)
}

function sfx_disable() {
	global.sfx.enabled = false
}

function sfx_enable() {
	global.sfx.enabled = true
}

function set_sfx_gain(_gain) {
	global.sfx.gain = _gain
	if global.sfx.gain >= 0 {
		sfx_enable()
	} else {
		sfx_disable()	
	}	
}

function get_sfx_gain() {
	return global.sfx.gain
}

function sfx_resume() {
	var _ids = tag_get_assets("sfx");
	for (var _i = 0; _i < array_length(_ids); _i++) {
		var _snd = asset_get_index(_ids[_i])
		audio_resume_sound(_snd)	
	}
}

function sfx_pause() {
	var _ids = tag_get_assets("sfx");
	for (var _i = 0; _i < array_length(_ids); _i++) {
		var _snd = asset_get_index(_ids[_i])
		audio_pause_sound(_snd)	
	}
}