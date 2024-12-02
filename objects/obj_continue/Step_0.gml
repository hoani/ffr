/// @description Insert description here
// You can write your code in this editor
event_inherited()

if state.current != TITLE_IDLE {
	return
}

if state.mono == 30 {
	create_sfx(snd_continue)
}

if cmd1_pressed(CMD_UP) {
	image_index--
	if image_index < 0 {
		image_index += 2
	}
}

if cmd1_pressed(CMD_DOWN) {
	image_index++
	if image_index >= 2 {
		image_index -= 2
	}
}

switch image_index {
	case CONTINUE_YES:
		if commands_continue_check() && state.mono > 16 {
			gamestate_set(STATE_SELECT)
		}
	break;
	case CONTINUE_NO:
		if commands_continue_check() && state.mono > 16 {
			gamestate_set(STATE_TITLE)
		}
	break;
}