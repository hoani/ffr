/// @description Insert description here
// You can write your code in this editor


if gamestate() == active_state || gamestate() == STATE_CONTINUE || gamestate == STATE_ENDING {
	draw_sprite(ploser().spr.defeat, 0, 900, 0)
	
	draw_sprite(pwinner().spr.victory, (state.mono/16) % FRAMES_VICTORY, room_width/2, 128)
	
	if winner.current == WINNER_TAUNT {
		var _a = clamp(winner.mono/16, 0, 1)
		draw_taunt(pwinner().snd.victory[taunt_index].text, global.winner+2, _a)
	}
	if winner.current == WINNER_END {
		var _a = clamp(1-winner.mono/16, 0, 1)
		draw_taunt(pwinner().snd.victory[taunt_index].text, global.winner+2, _a)
	}
}


var _yoff = 0;

if state.current == TITLE_END {
	_yoff = state.step
}

draw_sprite_alpha(spr_names, iwinner(), 360, 160, image_alpha)
draw_sprite_alpha(sprite_index, 0, x, y, image_alpha)