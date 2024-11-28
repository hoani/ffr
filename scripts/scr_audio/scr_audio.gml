// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function audio_init() {
	audio_falloff_set_model(audio_falloff_linear_distance)
	audio_channel_num(128)

	global.audio_enabled = true

	sfx_init()
	music_init()
	
	set_sfx_gain(1/4)
	set_music_gain(1/4)
}

function sound_on(){
	audio_master_gain(1)
}

function sound_off(){
	audio_master_gain(0)
}

function toggle_sound() {
	if global.audio_enabled {
		audio_master_gain(0)
		global.audio_enabled = false
	} else {
		audio_master_gain(1)
		global.audio_enabled = true
	}
}