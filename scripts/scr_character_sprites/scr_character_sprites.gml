// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro FRAMES_IDLE 8
#macro FRAMES_FACEOFF 4 
#macro FRAMES_VICTORY 4
#macro FRAMES_DEFEATED 1
#macro FRAMES_ATTACK_IN 8
#macro FRAMES_ATTACK_OUT 8
#macro FRAMES_MISSED 8
#macro FRAMES_BLOCK 4
#macro FRAMES_DAMAGED 4
#macro FRAMES_FALL 4

function init_character_sprites(_which) {
	switch _which {
		case C_HOANI:
		return {
				avatar: spr_avatar_hoani,
				idle: spr_idle_hoani,
				faceoff: spr_faceoff_hoani,
				victory: spr_victory_hoani,
				defeat: spr_defeat_hoani,
				attack: [
					spr_attack_high_hoani,
					spr_attack_low_hoani,
				],
				attack: [
					spr_attack_high_hoani,
					spr_attack_low_hoani,
				],
				block: [
					spr_block_high_hoani,
					spr_block_low_hoani,
				],
				attack: [
					spr_attack_high_hoani,
					spr_attack_low_hoani,
				],
				attack: [
					spr_attack_high_hoani,
					spr_attack_low_hoani,
				],
			}
			case C_BUCKET:
		return {
				avatar: spr_avatar_bucket,
				idle: spr_idle_bucket,
				faceoff: spr_faceoff_bucket,
				victory: spr_victory_bucket,
				defeat: spr_defeat_bucket,
				attack: [
					spr_attack_high_bucket,
					spr_attack_low_bucket,
				],
				attack: [
					spr_attack_high_bucket,
					spr_attack_low_bucket,
				],
				block: [
					spr_block_high_bucket,
					spr_block_low_bucket,
				],
				attack: [
					spr_attack_high_bucket,
					spr_attack_low_bucket,
				],
				attack: [
					spr_attack_high_bucket,
					spr_attack_low_bucket,
				],
			}
			case C_WIZARD:
		return {
				avatar: spr_avatar_wizard,
				idle: spr_idle_wizard,
				faceoff: spr_faceoff_wizard,
				victory: spr_victory_wizard,
				defeat: spr_defeat_wizard,
				attack: [
					spr_attack_high_wizard,
					spr_attack_low_wizard,
				],
				attack: [
					spr_attack_high_wizard,
					spr_attack_low_wizard,
				],
				block: [
					spr_block_high_wizard,
					spr_block_low_wizard,
				],
				attack: [
					spr_attack_high_wizard,
					spr_attack_low_wizard,
				],
				attack: [
					spr_attack_high_wizard,
					spr_attack_low_wizard,
				],
			}
			case C_KITSUNE:
		return {
				avatar: spr_avatar_kitsune,
				idle: spr_idle_kitsune,
				faceoff: spr_faceoff_kitsune,
				victory: spr_victory_kitsune,
				defeat: spr_defeat_kitsune,
				attack: [
					spr_attack_high_kitsune,
					spr_attack_low_kitsune,
				],
				attack: [
					spr_attack_high_kitsune,
					spr_attack_low_kitsune,
				],
				block: [
					spr_block_high_kitsune,
					spr_block_low_kitsune,
				],
				attack: [
					spr_attack_high_kitsune,
					spr_attack_low_kitsune,
				],
				attack: [
					spr_attack_high_kitsune,
					spr_attack_low_kitsune,
				],
			}
			case C_BONE:
		return {
				avatar: spr_avatar_bone,
				idle: spr_idle_bone,
				faceoff: spr_faceoff_bone,
				victory: spr_victory_bone,
				defeat: spr_defeat_bone,
				attack: [
					spr_attack_high_bone,
					spr_attack_low_bone,
				],
				attack: [
					spr_attack_high_bone,
					spr_attack_low_bone,
				],
				block: [
					spr_block_high_bone,
					spr_block_low_bone,
				],
				attack: [
					spr_attack_high_bone,
					spr_attack_low_bone,
				],
				attack: [
					spr_attack_high_bone,
					spr_attack_low_bone,
				],
			}
			case C_SKELLETREX:
		return {
				avatar: spr_avatar_skelletrex,
				idle: spr_idle_skelletrex,
				faceoff: spr_faceoff_skelletrex,
				victory: spr_victory_skelletrex,
				defeat: spr_defeat_skelletrex,
				attack: [
					spr_attack_high_skelletrex,
					spr_attack_low_skelletrex,
				],
				attack: [
					spr_attack_high_skelletrex,
					spr_attack_low_skelletrex,
				],
				block: [
					spr_block_high_skelletrex,
					spr_block_low_skelletrex,
				],
				attack: [
					spr_attack_high_skelletrex,
					spr_attack_low_skelletrex,
				],
				attack: [
					spr_attack_high_skelletrex,
					spr_attack_low_skelletrex,
				],
			}
	}
}