/// @description Insert description here
// You can write your code in this editor


if gamestate() == active_state {
	draw_sprite(spr_p1().faceoff, (state.mono/16) % 4, 512, 96)
	draw_sprite(spr_names, global.p1, 320, 160)

	draw_sprite_flipped(spr_p2().faceoff, ((state.mono/16) + 2) % 4, 769, 96)
	draw_sprite(spr_names, global.p2, 960, 160)
	
	if faceoff.current == FACEOFF_TAUNT1 {
		var _a = clamp(faceoff.mono/16, 0, 1)
		draw_taunt(p1().snd.faceoff[taunt1_index].text, 0, _a)
	}
	if faceoff.current == FACEOFF_TAUNT2 {
		var _a = clamp(1-faceoff.mono/16, 0, 1)
		draw_taunt(p1().snd.faceoff[taunt1_index].text, 0, _a)
		_a = 1 - _a
		draw_taunt(p2().snd.faceoff[taunt2_index].text, 1, _a)
	}
	if faceoff.current == FACEOFF_END {
		var _a = clamp(1-faceoff.mono/16, 0, 1)
		draw_taunt(p2().snd.faceoff[taunt2_index].text, 1, _a)
	}



	if global.singleplayer {
		for (var _i = 0; _i < C_TOTAL; _i++) {
			var _y = room_height - (102 + _i*(88));
			var _x = room_width- 8;
			var _c = c_white;
			var _a = 1;
			if _i < global.enemy_index {
				_c = c_red;
				_a = 0.5
			}
			if _i > global.enemy_index {
				_c = c_dkgray
			}
			draw_sprite_ext(spr_character_track, _i, _x, _y, 1, 1, 0, _c, _a);	
		}
	}
}


var _yoff = 0;

if state.current == TITLE_END {
	_yoff = state.step
}

draw_sprite_alpha(sprite_index, 0, x, y, image_alpha)