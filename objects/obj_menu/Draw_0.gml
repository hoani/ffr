/// @description Insert description here
// You can write your code in this editor


var _grow = 1;

if state.current == TITLE_END {
	_grow += state.step/16
}

draw_sprite_ext(sprite_index, image_index, x, y, _grow, _grow, 0, c_white, image_alpha)

var _yoff = -480;

if state.current == TITLE_END {
	_yoff -= state.step*8
}

draw_sprite_alpha(spr_title, 0, room_width/2, y+_yoff, image_alpha)

switch image_index {
	case SELECT_CONTROLS:
		draw_fade(c_black, 0.825)
		
		draw_sprite(spr_controls, 0, 0, 0)
	
	break;
	case SELECT_CREDITS:
		draw_fade(c_black, 0.825)
		
		draw_sprite(spr_credits, 0, 0, 0)
	break;
}
