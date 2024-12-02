/// @description Insert description here
// You can write your code in this editor
event_inherited()


if state.current != TITLE_IDLE || state.mono < 5 {
	return
}

state_update(winner)

function winner_sound_update(_snd, _next) {
	if winner.mono < 15 {
		return
	}
	if snd == -1 {
		snd = sfx_play(sfx, _snd)
	} else if !audio_is_playing(snd) {
		state_set(winner, _next)
		snd = -1
	}
}

switch winner.current {
	case WINNER_NAME:
		winner_sound_update(snd_name(iwinner()), WINNER_WINS)
		break
	case WINNER_WINS:
		winner_sound_update(snd_wins, WINNER_COOLDOWN)
		break	
	case WINNER_COOLDOWN:
		if winner.mono > 30 {
			state_set(winner, WINNER_TAUNT)
			taunt_index = irandom(1)
		}
		break
	case WINNER_TAUNT:
		winner_sound_update(pwinner().snd.victory[taunt_index].audio, WINNER_END)
		break
	case WINNER_END:
		if winner.mono > 30 {
			winner_do_end()
		}
		break
}

if commands_continue_check() {
	if snd != -1 {
		audio_stop_sound(snd)
		winner_do_end()
	}
}


function winner_do_end() {
	winner = new_state(WINNER_NAME)
	snd = -1
	taunt_index = 0
	if global.singleplayer {
		if global.winner == PLAYER_ONE {
			global.enemy_index++
			if (global.enemy_index < C_TOTAL) {
				gamestate_set(STATE_FACEOFF)
			} else {
				gamestate_set(STATE_ENDING)
			}
		} else {
			gamestate_set(STATE_CONTINUE)
		}
	} else {
		gamestate_set(STATE_SELECT)
	}	
}
			
	