/// @description Insert description here
// You can write your code in this editor


if gamestate() == active_state {
	draw_sprite(spr_p1().faceoff, (state.mono/16) % 4, 512, 96)
	draw_sprite(spr_names, global.p1, 320, 160)

	draw_sprite_flipped(spr_p2().faceoff, ((state.mono/16) + 2) % 4, 769, 96)
	draw_sprite(spr_names, global.p2, 960, 160)
}


var _yoff = 0;

if state.current == TITLE_END {
	_yoff = state.step
}

draw_sprite_alpha(sprite_index, 0, x, y, image_alpha)