// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function init_character_snd(_which) {
	switch _which {
		case C_HOANI:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_hoani,
						text: "Don't go easy on me",
					},
					{
						audio: snd_faceoff1_hoani,
						text: "You're gonna lose",
					},
					{
						audio: snd_faceoff2_hoani,
						text: "Try to make this a challenge for me",
					},
				],
				victory: [
					{
						audio: snd_victory0_hoani,
						text: "Too bad, tough guy",
					},
					{
						audio: snd_victory1_hoani,
						text: "You're just... not on my level",
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
				music: snd_music_hoani,
			}
		case C_BUCKET:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_bucket,
						text: "Let's get it bro!",
					},
					{
						audio: snd_faceoff1_bucket,
						text: "Baby, this is what we live for!",
					},
					{
						audio: snd_faceoff2_bucket,
						text: "Let your fists do the talkin'",
					},
				],
				victory: [
					{
						audio: snd_victory0_bucket,
						text: "The Bucket gets it done!",
					},
					{
						audio: snd_victory1_bucket,
						text: "Now that's what I'm talkin' about",
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
				music: snd_music_bucket,
			}
		case C_WIZARD:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_wizard,
						text: "I look forward to our quarrel",
					},
					{
						audio: snd_faceoff1_wizard,
						text: "Prepare yourself",
					},
					{
						audio: snd_faceoff2_wizard,
						text: "You must know, I do not\ntake kindly to threats",
					},
				],
				victory: [
					{
						audio: snd_victory0_wizard,
						text: "Perhaps you will be ready to fight\nme again...in a hundred years",
					},
					{
						audio: snd_victory1_wizard,
						text: "You would be wise to take your\ntraining seriously",
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
				music: snd_music_wizard,
			}
		case C_KITSUNE:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_kitsune,
						text: "I am Kitsune",
					},
					{
						audio: snd_faceoff1_kitsune,
						text: "You're an... idiot aren't you?",
					},
					{
						audio: snd_faceoff2_kitsune,
						text: "You're already dead",
					},
				],
				victory: [
					{
						audio: snd_victory0_kitsune,
						text: "Good grief...",
					},
					{
						audio: snd_victory1_kitsune,
						text: "See ya!",
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
				music: snd_music_kitsune,
			}
		case C_BONE:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_bone,
						text: "You look... weak",
					},
					{
						audio: snd_faceoff1_bone,
						text: "I'm gonna rip out your spine",
					},
					{
						audio: snd_faceoff2_bone,
						text: "Welcome to the bone brigade",
					},
				],
				victory: [
					{
						audio: snd_victory0_bone,
						text: "Your bones... aren't worth stealing",
					},
					{
						audio: snd_victory1_bone,
						text: "Worth my weight in bones",
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
				music: snd_music_bone,
			}
		case C_SKELLETREX:
		return {
				faceoff: [
					{
						audio: snd_faceoff0_skelletrex,
						text: "Let's have a good fight",
					},
					{
						audio: snd_faceoff1_skelletrex,
						text: "I look forward to testing\nmyself, against you.",
					},
					{
						audio: snd_faceoff2_skelletrex,
						text: "You look strong.",
					},
				],
				victory: [
					{
						audio: snd_victory0_skelletrex,
						text: "I wish you a speedy recovery",
					},
					{
						audio: snd_victory1_skelletrex,
						text: "Don't give up friend...\nWe all have our bad days",
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
				music: snd_music_skelletrex,
			}
	}
}