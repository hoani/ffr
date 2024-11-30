// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_sprite_alpha(_spr, _img, _x, _y, _alpha){
	draw_sprite_ext(_spr, _img, _x, _y, 1, 1, 0, c_white, _alpha)
}

function draw_fade(_color, _alpha) {
	draw_set_alpha(_alpha)
	draw_set_color(_color)
	draw_rectangle(0, 0, room_width, room_height, 0)
	draw_set_color(c_white)
	draw_set_alpha(1)
}

function draw_sprite_flipped(_spr, _img, _x, _y) {
	draw_sprite_ext(_spr, _img, _x, _y, -1, 1, 0, c_white, 1)
}