/// @description Insert description here
// You can write your code in this editor
event_inherited()

if state.current != TITLE_IDLE {
	return
}

if cmd1_pressed(CMD_UP) {
	image_index--
	if image_index < 0 {
		image_index += 4
	}
}

if cmd1_pressed(CMD_DOWN) {
	image_index++
	if image_index >= 4 {
		image_index -= 4
	}
}

switch image_index {
	case SELECT_STORYMODE:
		if commands_continue_check() && state.mono > 16 {
			set_singleplayer()
			gamestate_set(STATE_SELECT)
		}
	break;
	case SELECT_MULTIPLAYER:
		if commands_continue_check() && state.mono > 16 {
			set_multiplayer()
			gamestate_set(STATE_SELECT)
		}
	break;
	case SELECT_CONTROLS:
	
	break;
	case SELECT_CREDITS:
	
	break;
}