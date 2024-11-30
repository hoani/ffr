/// @description Insert description here
// You can write your code in this editor
event_inherited()

if gamestate() != TITLE_IDLE {
	return
}

if cmd1_pressed(CMD_UP) || cmd1_pressed(CMD_FORWARD)  {
	p1_select_next()
}

if cmd1_pressed(CMD_DOWN) || cmd1_pressed(CMD_BACK) {
	p1_select_prev()
}

if !global.singleplayer {
	if cmd2_pressed(CMD_UP) || cmd2_pressed(CMD_FORWARD)  {
		p2_select_next()
	}

	if cmd2_pressed(CMD_DOWN) || cmd2_pressed(CMD_BACK) {
		p2_select_prev()
	}
}

if commands_continue_check() && state.mono > 16 {
	gamestate_set(STATE_FACEOFF)
}
