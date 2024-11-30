// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function init_character_snd(_which) {
	switch _which {
		case C_HOANI:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_hoani,
						text: "",
					},
					{
						audio: snd_faceoff1_hoani,
						text: "",
					},
					{
						audio: snd_faceoff2_hoani,
						text: "",
					},
				],
				victory: [
					{
						audio: snd_victory0_hoani,
						text: "",
					},
					{
						audio: snd_victory1_hoani,
						text: "",
					},
				],
				attack: [
					snd_attack0_hoani,
					snd_attack1_hoani,
				],
				damage: [
					snd_damage0_hoani,
					snd_damage1_hoani,
				],
			}
		case C_BUCKET:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_bucket,
						text: "",
					},
					{
						audio: snd_faceoff1_bucket,
						text: "",
					},
					{
						audio: snd_faceoff2_bucket,
						text: "",
					},
				],
				victory: [
					{
						audio: snd_victory0_bucket,
						text: "",
					},
					{
						audio: snd_victory1_bucket,
						text: "",
					},
				],
				attack: [
					snd_attack0_bucket,
					snd_attack1_bucket,
				],
				damage: [
					snd_damage0_bucket,
					snd_damage1_bucket,
				],
			}
		case C_WIZARD:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_wizard,
						text: "",
					},
					{
						audio: snd_faceoff1_wizard,
						text: "",
					},
					{
						audio: snd_faceoff2_wizard,
						text: "",
					},
				],
				victory: [
					{
						audio: snd_victory0_wizard,
						text: "",
					},
					{
						audio: snd_victory1_wizard,
						text: "",
					},
				],
				attack: [
					snd_attack0_wizard,
					snd_attack1_wizard,
				],
				damage: [
					snd_damage0_wizard,
					snd_damage1_wizard,
				],
			}
		case C_KITSUNE:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_kitsune,
						text: "",
					},
					{
						audio: snd_faceoff1_kitsune,
						text: "",
					},
					{
						audio: snd_faceoff2_kitsune,
						text: "",
					},
				],
				victory: [
					{
						audio: snd_victory0_kitsune,
						text: "",
					},
					{
						audio: snd_victory1_kitsune,
						text: "",
					},
				],
				attack: [
					snd_attack0_kitsune,
					snd_attack1_kitsune,
				],
				damage: [
					snd_damage0_kitsune,
					snd_damage1_kitsune,
				],
			}
		case C_BONE:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_bone,
						text: "",
					},
					{
						audio: snd_faceoff1_bone,
						text: "",
					},
					{
						audio: snd_faceoff2_bone,
						text: "",
					},
				],
				victory: [
					{
						audio: snd_victory0_bone,
						text: "",
					},
					{
						audio: snd_victory1_bone,
						text: "",
					},
				],
				attack: [
					snd_attack0_bone,
					snd_attack1_bone,
				],
				damage: [
					snd_damage0_bone,
					snd_damage1_bone,
				],
			}
		case C_SKELLETREX:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_skelletrex,
						text: "",
					},
					{
						audio: snd_faceoff1_skelletrex,
						text: "",
					},
					{
						audio: snd_faceoff2_skelletrex,
						text: "",
					},
				],
				victory: [
					{
						audio: snd_victory0_skelletrex,
						text: "",
					},
					{
						audio: snd_victory1_skelletrex,
						text: "",
					},
				],
				attack: [
					snd_attack0_skelletrex,
					snd_attack1_skelletrex,
				],
				damage: [
					snd_damage0_skelletrex,
					snd_damage1_skelletrex,
				],
			}
	}
}