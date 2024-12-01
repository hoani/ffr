/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if state.current != TITLE_IDLE || state.mono < 30 {
	return
}

state_update(combat)


function combat_sound_update(_snd, _next) {
	if combat.mono < 15 {
		return
	}
	if snd == -1 {
		snd = sfx_play(sfx, _snd)
	} else if !audio_is_playing(snd) {
		state_set(combat, _next)
		snd = -1
	}
}


switch combat.current {
	case COMBAT_START:
		combat_sound_update(snd_ready_fight, COMBAT_RUNNING)
		break
	case COMBAT_RUNNING:
		// TODO: accept commands
		// TODO: Look for win condition
		fighter_command_update(f1, global.cmd1);
		if !global.singleplayer {
			fighter_command_update(f2, global.cmd2);
		}
		
		break	
	case COMBAT_END:
		if combat.mono > 30 {
			combat = new_state(COMBAT_START)
			snd = -1
			gamestate_set(STATE_WINNER)
		}
		break
}



var _sig1 = fighter_update(f1, f2)
var _sig2 = fighter_update(f2, f1)

if _sig1 != SIG_NONE {
	fighter_apply_signal_to_opponent(f1, f2, _sig1)	
}

if _sig2 != SIG_NONE {
	fighter_apply_signal_to_opponent(f2, f1, _sig2)	
}


	
