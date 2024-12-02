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

function draw_taunt(_text, _index, _a) {
	draw_sprite_alpha(spr_textbox, _index, room_width/2, room_height, _a)
	draw_set_font(fnt_taunt)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	if _a > 0.5 {
		draw_set_color(c_ltgray)
		draw_text(room_width/2+6, room_height - 128 + 6, _text)
		draw_set_color(c_black)
		draw_text(room_width/2, room_height - 128, _text)
	}
}

