/// @description Insert description here
// You can write your code in this editor
state_update(state)

switch state.current {
	case TITLE_START:
		if fade_in {
		    image_alpha = state.step/TITLE_FADE_PER_STEP	
	
			if image_alpha >= 1 {
				state_set(state, TITLE_IDLE)
			}
		} else {
			image_alpha = 1
			state_set(state, TITLE_IDLE)
		}
		break;
	case TITLE_IDLE:
		image_alpha = 1;
		if gamestate() != active_state {
			state_set(state, TITLE_END);
		}
		break;
	case TITLE_END:
		if fade_out {
			image_alpha = 1 - state.step/TITLE_FADE_PER_STEP	
	
			if image_alpha <= 0 {
				state_set(state, TITLE_HIDDEN)
			}
		} else {
			image_alpha = 0
			state_set(state, TITLE_HIDDEN)
		}
		break;
	case TITLE_HIDDEN:
		image_alpha = 0
		if gamestate() == active_state {
			state_set(state, TITLE_START)
		}
		break;
}