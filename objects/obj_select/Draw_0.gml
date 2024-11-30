/// @description Insert description here
// You can write your code in this editor



if state.current == active_state {

	draw_sprite(spr_p1().faceoff, 0, 512, 96)
	draw_sprite(spr_names, global.p1, 320, 160)
	draw_sprite(spr_stats, global.p1, 32, 320)

	if !global.singleplayer {
		draw_sprite_flipped(spr_p2().faceoff, 0, 769, 96)
		draw_sprite(spr_names, global.p2, 960, 160)
		draw_sprite(spr_stats, global.p2, 928, 320)
	}
}


var _yoff = 0;

if state.current == TITLE_END {
	_yoff = state.step
}

draw_sprite_alpha(sprite_index, 0, x, y, image_alpha)
