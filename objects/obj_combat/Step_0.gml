/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if state.current != TITLE_IDLE {
	return	
}

state_update(combat)


function combat_intro_update() {
	if combat.mono < 15 {
		return
	}
	if snd == -1 {
		snd = sfx_play(sfx, snd_ready_fight)
	} else if !audio_is_playing(snd) {
		state_set(combat, COMBAT_RUNNING)
		snd = -1
		if global.singleplayer || irandom(1) == 0 {
			music_start(p2().snd.music)
		} else {
			music_start(p1().snd.music)	
		}
	}
}


switch combat.current {
	case COMBAT_START:
		combat_intro_update()
		break
	case COMBAT_RUNNING:
		fighter_command_update(f1, global.cmd1);
		if !global.singleplayer {
			fighter_command_update(f2, global.cmd2);
		}
		
		break	
	case COMBAT_END:
		if combat.mono >= 16*4-1 {
			combat = new_state(COMBAT_START)
			snd = -1
			gamestate_set(STATE_WINNER)
		}
		break
}



var _sig1 = fighter_update(f1, f2)
var _sig2 = fighter_update(f2, f1)

if combat.current == COMBAT_RUNNING {
	if _sig1 != SIG_NONE {
		fighter_apply_signal_to_opponent(f1, f2, _sig1)	
	}

	if _sig2 != SIG_NONE {
		fighter_apply_signal_to_opponent(f2, f1, _sig2)	
	}

	if f1.health <= 0 {
		global.winner = PLAYER_TWO
		state_set(combat, COMBAT_END)
		music_fade_out(500)
		if global.singleplayer {
			create_sfx(snd_lose_jingle)
		} else {
			create_sfx(snd_win_jingle)
		}
	} else if f2.health <= 0 {
		global.winner = PLAYER_ONE
		state_set(combat, COMBAT_END)
		music_fade_out(500)
		create_sfx(snd_win_jingle)
	}
}
	


	
