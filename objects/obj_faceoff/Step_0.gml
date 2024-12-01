/// @description Insert description here
// You can write your code in this editor
event_inherited()


if state.current != TITLE_IDLE || state.mono < 5 {
	return
}

state_update(faceoff)

function faceoff_sound_update(_snd, _next) {
	if faceoff.mono < 15 {
		return
	}
	if snd == -1 {
		snd = sfx_play(sfx, _snd)
	} else if !audio_is_playing(snd) {
		state_set(faceoff, _next)
		snd = -1
	}
}

switch faceoff.current {
	case FACEOFF_NAME1:
		faceoff_sound_update(snd_p1_name(), FACEOFF_VERSUS)
		break
	case FACEOFF_VERSUS:
		faceoff_sound_update(snd_versus, FACEOFF_NAME2)
		break	
	case FACEOFF_NAME2:
		faceoff_sound_update(snd_p2_name(), FACEOFF_COOLDOWN)
		break
	case FACEOFF_COOLDOWN:
		if faceoff.mono > 30 {
			state_set(faceoff, FACEOFF_TAUNT1)
			taunt1_index = irandom(3)
			taunt2_index = irandom(3)
		}
		break
	case FACEOFF_TAUNT1:
		faceoff_sound_update(p1().snd.faceoff[taunt1_index].audio, FACEOFF_TAUNT2)
		break
	case FACEOFF_TAUNT2:
		faceoff_sound_update(p1().snd.faceoff[taunt2_index].audio, FACEOFF_END)
		break
	case FACEOFF_END:
		if faceoff.mono > 30 {
			faceoff = new_state(FACEOFF_NAME1)
			snd = -1
			taunt1_index = 0
			taunt2_index = 0	
			gamestate_set(STATE_COMBAT)
		}
		break
}

if commands_continue_check() {
	if snd != -1 {
		audio_stop_sound(snd)
		faceoff = new_state(FACEOFF_NAME1)
		snd = -1
		taunt1_index = 0
		taunt2_index = 0	
		gamestate_set(STATE_COMBAT)
	}
}
			
	