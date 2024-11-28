// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_sprite_alpha(_spr, _img, _x, _y, _alpha){
	draw_sprite_ext(_spr, _img, _x, _y, 1, 1, 0, c_white, _alpha)
}