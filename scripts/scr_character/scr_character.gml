// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro C_HOANI 0
#macro C_BUCKET 1
#macro C_WIZARD 2
#macro C_KITSUNE 3
#macro C_BONE 4
#macro C_SKELLETREX 5
#macro C_TOTAL 6

// Attacks
#macro A_HIGH 0
#macro A_LOW 1
#macro A_TOTAL 2

// Stats
#macro S_LOW 0
#macro S_MED 1
#macro S_HIGH 2

// Voice
#macro V_FACEOFF 3
#macro V_VICTORY 2
#macro V_ATTACK 2
#macro V_DAMAGE 2





function characters_init(){
	global.c = []
	
	for (var _i = 0; _i < C_TOTAL; _i++) {
		array_push(global.c, {
			spr: init_character_sprites(_i),
			stats: init_character_stats(_i),
			snd: init_character_snd(_i),
		})
	}
}


function snd_name(_which){
	switch _which {
		case C_HOANI:
			return snd_name_hoani
		case C_BUCKET:
			return snd_name_bucket
		case C_WIZARD:
			return snd_name_wizard
		case C_KITSUNE:
			return snd_name_kitsune
		case C_BONE:
			return snd_name_bone
		case C_SKELLETREX:
			return snd_name_skelletrex
	}
}