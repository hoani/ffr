/// @description Insert description here
// You can write your code in this editor
event_inherited()

if state.current != TITLE_IDLE {
	return
}

if state.mono == 30 {
	create_sfx(snd_ending_jingle)
}




if commands_continue_check() && state.mono > 16 {
	gamestate_set(STATE_TITLE)
}