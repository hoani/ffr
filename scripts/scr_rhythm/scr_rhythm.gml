// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function draw_rhythm_circles() {
	draw_fighter_circles(f1, -1)
	draw_fighter_circles(f2, 1)
}


function draw_fighter_circles(_f, _sign) {
	var _y0 = 240;
	var _y1 = 440;
	var _w0 = 9/fighter_high_attack_speed(_f); 
	var _w1 = 9/fighter_low_attack_speed(_f)
	var _x0 = room_width/2 + _sign*(-420)
	
	
	var _hatk = (_f.state.current == FIGHT_HATK_START);
	var _latk = (_f.state.current == FIGHT_LATK_START);
	
	var _s = global.c[_f.which].stats;
	
	
	if _hatk {
		draw_fighter_attack_circle(_f, _s.high.spd, _x0, _y0);
	}
	
	if _latk {
		draw_fighter_attack_circle(_f, _s.low.spd, _x0, _y1);
	}
	
	draw_fighter_circle_detectors(_x0, _y0, _hatk);
	draw_fighter_circle_detectors(_x0, _y1, _latk);
	
}

function draw_fighter_attack_circle(_f, _level, _x, _y) {
	var _p = fighter_attacking_portion(_f)
	var _s = 1 - _p
	switch _level {
		case S_HIGH:
			break;
		case S_MED:
			_s = (1 - _p) * SPEED_HIGH/SPEED_MED
			break;
		case S_LOW:
			_s = (1 - _p) * SPEED_HIGH/SPEED_LOW
			break;
	}
	
	draw_sprite_ext(spr_attack_circle, 0, _x, _y, _s, _s, 0, c_red, 0.25 + clamp(_p/4, -0.25, 0.25))
}

function draw_fighter_circle_detectors(_x, _y, _active) {
	var _c = c_ltgray
	var _a = 0.5
	if _active {
		_c = c_red
		_a = 0.75
	}
	draw_sprite_ext(spr_attack_detector, 0, _x, _y, 1, 1, 0, _c, _a)
}

