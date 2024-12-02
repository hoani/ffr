// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro FIGHT_IDLE 0
#macro FIGHT_HATK_START 1
#macro FIGHT_HATK_END 2
#macro FIGHT_LATK_START 3
#macro FIGHT_LATK_END 4
#macro FIGHT_HBLK 5
#macro FIGHT_LBLK 6
#macro FIGHT_HDMG 7
#macro FIGHT_LDMG 8
#macro FIGHT_HMISS 9
#macro FIGHT_LMISS 10
#macro FIGHT_FALL 11

#macro SIG_NONE -1
#macro SIG_HATK 0
#macro SIG_LATK 1
#macro SIG_HBLK 2
#macro SIG_LBLK 3
#macro SIG_HDMG 4
#macro SIG_LDMG 5
#macro SIG_HMISS 6
#macro SIG_LMISS 7

#macro POWER_HIGH 12/64
#macro POWER_MED 9/64
#macro POWER_LOW 6/64



// Applies to attacks and misses
#macro SPEED_HIGH (20/512)  // ~1/2 s
#macro SPEED_MED  (16/512)  // ~2/3 s
#macro SPEED_LOW  (13/512)  // ~4/5 s

#macro DAMAGED_SPEED  (1/32)  // ~1/2s

#macro BLOCK_SPEED_HIGH (0.5*0.825/16) 
#macro BLOCK_SPEED_MED (0.5*1/16) // ~1/4s.
#macro BLOCK_SPEED_LOW (0.5*1.25/16)

#macro PARRY_PORTION_HIGH (28/64) 
#macro PARRY_PORTION_MED (24/64) // ~0.1s.
#macro PARRY_PORTION_LOW (20/64) 

#macro MISS_SPEED_FACTOR (0.5)

function get_attack_speed(_which) {
	switch _which {
		case S_HIGH:
			return SPEED_HIGH;
		case S_MED:
			return SPEED_MED;
		case S_LOW:
			return SPEED_LOW;
	}
}

function get_block_speed(_which) {
	switch _which {
		case S_HIGH:
			return BLOCK_SPEED_HIGH;
		case S_MED:
			return BLOCK_SPEED_MED;
		case S_LOW:
			return BLOCK_SPEED_LOW;
	}
}

function get_parry_portion(_which) {
	switch _which {
		case S_HIGH:
			return PARRY_PORTION_HIGH;
		case S_MED:
			return PARRY_PORTION_MED;
		case S_LOW:
			return PARRY_PORTION_LOW;
	}
}

function get_attack_frame_speed(_which) {
	return get_frame_speed(get_attack_speed(_which), FRAMES_ATTACK_IN)
}

function get_missed_speed(_which) {
	return get_attack_speed(_which)	* MISS_SPEED_FACTOR
}

function get_missed_frame_speed(_which) {
	return get_frame_speed(get_missed_speed(_which), FRAMES_MISSED)
}

function get_frame_speed(_speed, _frames) {
	return 1/(_speed*_frames);
}



function new_fighter(_which){
	return {
		state: new_state(FIGHT_IDLE),
		which: _which,
		health: 1.0,
		health_prev: 1.0,
		snd: -1,
		sfx: new_sfx(),
		cloud: {
			angle: 0,
			index: 0,
		}
	}
}

function fighter_update(_f, _other) {
	state_update(_f.state)
	
	if _f.health_prev != _f.health {
		_f.health_prev = (15/16)*_f.health_prev + (1/16)*_f.health;
		if _f.health_prev - _f.health < 1/256 {
			_f.health_prev = _f.health
		}
	}
	
	if _f.health == 0.0 {
		return SIG_NONE
	}
	
	var _s = global.c[_f.which].stats;
	
	switch _f.state.current {
		case FIGHT_IDLE:
			break;
		case FIGHT_HATK_START:
			if _f.state.step * get_attack_speed(_s.high.spd) >= 1.0 {
				state_set(_f.state, FIGHT_HATK_END);
				return SIG_HDMG
			}
			break;
		case FIGHT_HATK_END:
			if _f.state.step * get_attack_speed(_s.high.spd) >= 1.0 {
				state_set(_f.state, FIGHT_IDLE);
			}
			break;
		case FIGHT_LATK_START:
			if _f.state.step * get_attack_speed(_s.low.spd) >= 1.0 {
				state_set(_f.state, FIGHT_LATK_END);
				return SIG_LDMG
			}
			break;
		case FIGHT_LATK_END:
			if _f.state.step * get_attack_speed(_s.low.spd) >= 1.0 {
				state_set(_f.state, FIGHT_IDLE);
			}
			break;
		case FIGHT_HBLK:
		case FIGHT_LBLK:
			var _portion = _f.state.step * get_block_speed(_s.defense);
			if _portion < 0.1 {
				return fighter_parry_check(_f, _other)
			}
			if _portion >= 1.0 {
				state_set(_f.state, FIGHT_IDLE);
			}
			break;
		case FIGHT_HDMG:	  
		case FIGHT_LDMG:	  
			if _f.state.step * DAMAGED_SPEED >= 1.0 {
				state_set(_f.state, FIGHT_IDLE);
			}
			break;
		case FIGHT_HMISS:	  
			if _f.state.step * get_missed_speed(_s.high.rec) >= 1.0 {
				state_set(_f.state, FIGHT_IDLE);
			}
			break;
		case FIGHT_LMISS:	  
			if _f.state.step * get_missed_speed(_s.high.rec) >= 1.0 {
				state_set(_f.state, FIGHT_IDLE);
			}
			break;
		case FIGHT_FALL:
			break;
	}
	return SIG_NONE;
}

function fighter_high_attack_speed(_f) {
	var _s = global.c[_f.which].stats;
	return get_attack_speed(_s.high.spd);
}

function fighter_low_attack_speed(_f) {
	var _s = global.c[_f.which].stats;
	return get_attack_speed(_s.low.spd);
}

function fighter_parry_check(_f1, _f2) {
	var _s1 = global.c[_f1.which].stats;
	var _s2 = global.c[_f2.which].stats;
	var _spd = 0;
	var _frac = 1;
	switch _f2.state.current {
		case FIGHT_HATK_START:
			if _f1.state.current != FIGHT_HBLK {
				return SIG_NONE;
			}
			_frac = _f2.state.step * get_attack_speed(_s2.high.spd)
			
			if (1 - _frac) < get_parry_portion(_s1.defense) {  
				return SIG_HMISS
			}
			break;
		case FIGHT_LATK_START:
			if _f1.state.current != FIGHT_LBLK {
				return SIG_NONE;
			}
			_frac = _f2.state.step * get_attack_speed(_s2.low.spd)
			
			if (1 - _frac) < get_parry_portion(_s1.defense) {  
				return SIG_LMISS
			}
			break;
	}
	return SIG_NONE;
}

function fighter_image_index(_f) {	
	var _s = global.c[_f.which].stats;
	
	switch _f.state.current {
		case FIGHT_IDLE:
			return animate(0, FRAMES_IDLE, 8, _f.state.step)
		case FIGHT_HATK_START:
			return animate(0, FRAMES_ATTACK_IN, get_attack_frame_speed(_s.high.spd), _f.state.step)
		case FIGHT_HATK_END:
			return animate(FRAMES_ATTACK_IN, FRAMES_ATTACK_OUT, get_attack_frame_speed(_s.high.spd), _f.state.step)
		case FIGHT_LATK_START:
			return animate(0, FRAMES_ATTACK_IN, get_attack_frame_speed(_s.low.spd), _f.state.step)
		case FIGHT_LATK_END:  
			return animate(FRAMES_ATTACK_IN,  FRAMES_ATTACK_OUT, get_attack_frame_speed(_s.low.spd), _f.state.step)
		case FIGHT_HBLK:
		case FIGHT_LBLK:
			return animate(0, FRAMES_BLOCK, get_frame_speed(get_block_speed(_s.defense), FRAMES_BLOCK), _f.state.step)
		case FIGHT_HDMG:
		case FIGHT_LDMG:
			return animate(0, FRAMES_DAMAGED, get_frame_speed(DAMAGED_SPEED, FRAMES_DAMAGED), _f.state.step)
		case FIGHT_HMISS:	  
			return animate(0, FRAMES_MISSED, get_missed_frame_speed(_s.high.rec), _f.state.step);
		case FIGHT_LMISS:	  
			return animate(0, FRAMES_MISSED, get_missed_frame_speed(_s.low.rec), _f.state.step);
		case FIGHT_FALL:
			return animate(0, FRAMES_FALL, 16, _f.state.step)
	}
							  
}

function fighter_sfx_stop(_f) {
	if _f.snd != -1 {
		audio_stop_sound(_f.snd)
		_f.snd = -1
	}
}

function fighter_sfx_play(_f, _snd) {
	fighter_sfx_stop(_f)
	_f.snd = sfx_play(_f.sfx, _snd)
}

function fighter_signal_control(_f, _which) {
	switch _f.state.current {
		case FIGHT_IDLE:
		case FIGHT_HATK_START:
		case FIGHT_LATK_START:
			break;
		default:
			return;
	}
	
	var _c = global.c[_f.which]
	
	switch _which {
		case SIG_HATK:
			state_set(_f.state, FIGHT_HATK_START)
			fighter_sfx_play(_f, _c.snd.attack[0])
			return;
		case SIG_LATK:
			state_set(_f.state, FIGHT_LATK_START)
			fighter_sfx_play(_f, _c.snd.attack[1])
			return;
		case SIG_HBLK:
			state_set(_f.state, FIGHT_HBLK)
			fighter_sfx_stop(_f)
			return;
		case SIG_LBLK:
			state_set(_f.state, FIGHT_LBLK)
			fighter_sfx_stop(_f)
			return;
	}
}

function fighter_signal_damage_high(_f, _which) {
	if _f.state.current == FIGHT_HBLK {
		create_sfx(snd_hit_block)
		return;
	}
	state_set(_f.state, FIGHT_HDMG)
	fighter_apply_damage(_f, _which)
}

function fighter_signal_damage_low(_f, _which) {
	if _f.state.current == FIGHT_LBLK {
		create_sfx(snd_hit_block)
		return;
	}
	state_set(_f.state, FIGHT_LDMG)
	fighter_apply_damage(_f, _which)
}

function fighter_signal_missed_high(_f, _which) {
	state_set(_f.state, FIGHT_HMISS)
}

function fighter_signal_missed_low(_f, _which) {
	state_set(_f.state, FIGHT_LMISS)
}



function fighter_apply_damage(_f, _which) {
	switch _which {
		case S_HIGH:
			_f.health -= POWER_HIGH
			break;
		case S_MED:
			_f.health -= POWER_MED
			break;
		case S_LOW:
			_f.health -= POWER_LOW
			break;
		default:
			return;
	}
	_f.cloud.angle = random(360)
	_f.cloud.index = irandom(sprite_get_number(spr_damage_cloud)-1)
	var _c = global.c[_f.which]
	fighter_sfx_play(_f, _c.snd.damage[irandom(1)])
	if _f.health <= 0 {
		_f.health = 0;
		state_set(_f.state, FIGHT_FALL)
	}
}

function fighter_apply_signal_to_opponent(_f1, _f2, _sig) {
	var _s = global.c[_f1.which].stats;
	switch _sig {
		case SIG_HDMG:
			fighter_signal_damage_high(_f2, _s.high.pwr)
			return;
		case SIG_LDMG:
			fighter_signal_damage_low(_f2, _s.low.pwr)
			return;
		case SIG_HMISS:
			state_set(_f2.state, FIGHT_HMISS);
			return;
		case SIG_LMISS:
			state_set(_f2.state, FIGHT_LMISS);
			return;
	}
}

function fighter_draw(_f, _x, _y, _draw) {
	var _spr = global.c[_f.which].spr;
	var _img = fighter_image_index(_f)
	switch _f.state.current {
		case FIGHT_IDLE:
			_draw(_spr.idle, _img, _x, _y)
			break;
		case FIGHT_HATK_START:
		case FIGHT_HATK_END:  
			_draw(_spr.attack[A_HIGH], _img, _x, _y)
			break;
		case FIGHT_LATK_START:
		case FIGHT_LATK_END:
			_draw(_spr.attack[A_LOW], _img, _x, _y)
			break;
		case FIGHT_HBLK:
			_draw(_spr.block[A_HIGH], _img, _x, _y)
			break;
		case FIGHT_LBLK:
			_draw(_spr.block[A_LOW], _img, _x, _y)
			break;
		case FIGHT_HDMG:
			_draw(_spr.damage[A_HIGH], _img, _x, _y)
			break;
		case FIGHT_LDMG:
			_draw(_spr.damage[A_LOW], _img, _x, _y)
			break;
		case FIGHT_HMISS:
			_draw(_spr.missed[A_HIGH], _img, _x, _y)
			break;
		case FIGHT_LMISS:
			_draw(_spr.missed[A_LOW], _img, _x, _y)
			break;
		case FIGHT_FALL:
			_draw(_spr.fall, _img, _x, _y)
			break;
	}
}

function fighter_draw_damage_cloud(_f, _x) {
	var _a = clamp(1-_f.state.mono/16, 0, 1)
	var _s = 1+_f.state.mono/8
	switch _f.state.current {
		case FIGHT_HDMG:
			draw_sprite_ext(spr_damage_cloud, _f.cloud.index, _x, 240, _s, _s, _f.cloud.angle, c_white, _a)
			break;
		case FIGHT_LDMG:
			draw_sprite_ext(spr_damage_cloud, _f.cloud.index, _x, 420, _s, _s, _f.cloud.angle, c_white, _a)
			break;
	}
}

function fighter_command_update(_f, _cmds) {
	if commands_check_pressed(_cmds, CMD_BACK) {
		fighter_signal_control(_f, SIG_LBLK)
	} else if commands_check_pressed(_cmds, CMD_DOWN) {
		fighter_signal_control(_f, SIG_LATK)
	} else if commands_check_pressed(_cmds, CMD_UP) {
		fighter_signal_control(_f, SIG_HBLK)
	} else if commands_check_pressed(_cmds, CMD_FORWARD) {
		fighter_signal_control(_f, SIG_HATK)
	} 	
}

function fighter_foreground(_f) {
	switch _f.state.current {
		case FIGHT_IDLE:
		case FIGHT_HBLK:	  
		case FIGHT_LBLK:	  
		case FIGHT_HDMG:	  
		case FIGHT_LDMG:	  
			return false
	}
	return true
}


function fighter_attacking(_f) {
	switch _f.state.current {
		case FIGHT_HATK_START:
		case FIGHT_LATK_START:	  	  
			return true
	}
	return false
}

function fighter_blocking(_f) {
	switch _f.state.current {
		case FIGHT_HBLK:
		case FIGHT_LBLK:	  	  
			return true
	}
	return false
}

function fighter_attacking_portion(_f) {
	var _s = global.c[_f.which].stats;
	switch _f.state.current {
		case FIGHT_HATK_START:
			return _f.state.step * get_attack_speed(_s.high.spd)
		case FIGHT_LATK_START:
			return _f.state.step * get_attack_speed(_s.high.spd)
	}
	return 0
}





function copy_paste_switch(_f) {
	switch _f.state.current {
		case FIGHT_IDLE:
			break;
		case FIGHT_HATK_START:
			break;
		case FIGHT_HATK_END:  
			break;
		case FIGHT_LATK_START:
			break;
		case FIGHT_LATK_END:  
			break;
		case FIGHT_HBLK:	  
			break;
		case FIGHT_LBLK:	  
			break;
		case FIGHT_HDMG:	  
			break;
		case FIGHT_LDMG:	  
			break;
		case FIGHT_HMISS:	  
			break;
		case FIGHT_LMISS:	  
			break;
	}
}















