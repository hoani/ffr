// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function music_init() {
	global.music={
		enabled: true,
		bus: audio_bus_create(),
		em: audio_emitter_create(),
		prev: -1,
		current: -1,
		step: 0,
		gain: 0.5,
	}
	audio_emitter_bus(global.music.em, global.music.bus)
}

function music_fade(_track){
	music_fade_out(5000)
	
	global.music.current = audio_play_sound_on(global.music.em, _track, true, 3, 0)
	audio_sound_gain(global.music.current, 1, 5000)
	global.music.step = 0
}

function music_start(_track){
	music_stop()
	
	global.music.current = audio_play_sound_on(global.music.em, _track, true, 3, 1)
	global.music.step = 0
}

function music_stop() {
	if global.music.current != -1 && audio_is_playing(global.music.current) {
		audio_stop_sound(global.music.current)
	}	
}

function music_fade_out(_ms){
	if global.music.current != -1 && audio_is_playing(global.music.current) {
		global.music.prev = global.music.current
		audio_sound_gain(global.music.prev, 0, _ms)
	}
}

function music_update() {
	global.music.step+=global.s
	if global.music.step > 60*5 {
		if global.music.prev != -1 && audio_is_playing(global.music.prev) {
			audio_stop_sound(global.music.prev)
		}
	}
}
	
function music_disable() {
	global.music.enabled = false
	global.music.bus.gain = 0
}

function music_enable() {
	global.music.enabled = true
	global.music.bus.gain = global.music.gain
}

function music_toggle() {
	global.music.enabled = !global.music.enabled
	if global.music.enabled {
		global.music.bus.gain = global.music.gain
	} else {
		global.music.bus.gain = 0
	}
}

function set_music_gain(_gain) {
	global.music.gain = _gain
	if global.music.gain >= 0 {
		music_enable()
	} else {
		music_disable()	
	}	
}

function get_music_gain() {
	return global.music.gain
}
