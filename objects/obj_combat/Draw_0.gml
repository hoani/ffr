/// @description Insert description here
// You can write your code in this editor

if gamestate() == active_state {
	
	var _f1_foreground = fighter_foreground(f1);
	
	if !_f1_foreground {
		fighter_draw(f1, 512+24, 0, draw_sprite)
		fighter_draw_damage_cloud(f1, 512-32)
	}
	fighter_draw(f2, 769-24, 0, draw_sprite_flipped)
	fighter_draw_damage_cloud(f2, 769+32)
	if _f1_foreground {
		fighter_draw(f1, 512+24, 0, draw_sprite)
		fighter_draw_damage_cloud(f1, 512-32)
	}
	
	var _w = 542;
	var _hw1 = f1.health * _w;
	var _hwp1 = f1.health_prev * _w;
	var _hc1 = c_green;
	var _hw2 = f2.health * _w;
	var _hwp2 = f2.health_prev * _w;
	var _hc2 = c_green;
	var _hh = 64;
	
	draw_sprite(spr_healthbar_shell, 0, 16, 64)
	draw_sprite_part_ext(spr_healthbar, 0, 0, 0, _hwp1, _hh, 16 + _w, 32, -1, 1, c_red, 0.75)
	draw_sprite_part_ext(spr_healthbar, 0, 0, 0, _hw1, _hh, 16 + _w, 32, -1, 1, _hc1, 1)
	
	draw_sprite_flipped(spr_healthbar_shell, 0, room_width-16, 64)
	draw_sprite_part_ext(spr_healthbar, 0, 0, 0, _hwp2, _hh, room_width-(16 + _w), 32, 1, 1, c_red, 0.75)
	draw_sprite_part_ext(spr_healthbar, 0, 0, 0, _hw2, _hh, room_width-(16 + _w), 32, 1, 1, _hc2, 1)
	
	
	
	draw_rhythm_circles()
	
	if combat.current == COMBAT_START {
		var _f = 48;
		var _r = 8;
		var _l = 48;
		if combat.mono > _f {
			var _a = clamp(1 - (combat.mono-_f)/_l, 0, 1)
			var _s = 3-2*_a;
			draw_sprite_ext(spr_ready_fight, 1, room_width/2, room_height/2 - 128, _s, _s, 0, c_white, _a)
		}
		if combat.mono > _r {
			var _a = clamp(1 - (combat.mono-_r)/_l, 0, 1)
			var _s = 2-_a;
			draw_sprite_ext(spr_ready_fight, 0, room_width/2, room_height/2 - 128, _s, _s, 0, c_white, _a)
		}
		
	}
}






var _yoff = 0;

if state.current == TITLE_END {
	_yoff = state.step
}


