/// @description Insert description here
// You can write your code in this editor

var _spr_action = spr_instruction_mouse
var _img_text = 0
if is_mouse == false {
	_spr_action = spr_instruction_touch
	_img_text = 1
}

var _alpha = image_alpha

var _img_action = ((count)/8) % sprite_get_number(_spr_action)

draw_sprite_ext(_spr_action, _img_action, x, y, 1, 1, 0, c_white, _alpha)
draw_sprite_ext(spr_splash_text, _img_text, x, y,1, 1, 0, c_white, _alpha)
