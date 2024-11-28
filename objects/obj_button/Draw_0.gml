/// @description Insert description here
// You can write your code in this editor

if !visible {
	exit
}

var _col = c_gray
if hover {
	_col = c_white
}

var _alpha = min(image_alpha, global.gui_alpha)


draw_sprite_ext(spr_button, image_index, x, y, 1, 1, 0, _col, _alpha)