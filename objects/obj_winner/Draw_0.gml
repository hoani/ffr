/// @description Insert description here
// You can write your code in this editor


if gamestate() == active_state {
	draw_sprite_alpha(ploser().spr.defeat, 0, 900, 0, image_alpha)
	
	draw_sprite_alpha(pwinner().spr.victory, (state.mono/16) % FRAMES_VICTORY, room_width/2, 128, image_alpha)
	draw_sprite_alpha(spr_names, iwinner(), 360, 160, image_alpha)
}


var _yoff = 0;

if state.current == TITLE_END {
	_yoff = state.step
}

draw_sprite_alpha(sprite_index, 0, x, y, image_alpha)