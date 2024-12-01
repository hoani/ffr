/// @description Insert description here
// You can write your code in this editor

if gamestate() == active_state {
	
	var _f1_foreground = fighter_foreground(f1);
	
	if !_f1_foreground {
		fighter_draw(f1, 512+24, 0, draw_sprite)
	}
	fighter_draw(f2, 769-24, 0, draw_sprite_flipped)
	if _f1_foreground {
		fighter_draw(f1, 512+24, 0, draw_sprite)
	}
	
	draw_text(100, 100, string(f1.health));
	draw_text(1000, 100, string(f2.health));

}


var _yoff = 0;

if state.current == TITLE_END {
	_yoff = state.step
}


