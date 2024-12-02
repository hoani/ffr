/// @description Insert description here
// You can write your code in this editor


var _grow = 1;

if state.current == TITLE_END {
	_grow += state.step/16
}

draw_sprite_ext(sprite_index, image_index, room_width/2, room_height/2, _grow, _grow, 0, c_white, image_alpha)

var _yoff = -480;

if state.current == TITLE_END {
	_yoff -= state.step*8
}
