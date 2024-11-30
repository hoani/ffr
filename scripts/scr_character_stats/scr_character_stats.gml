// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function init_character_stats(_which) {
	switch _which {
		case C_HOANI:
		return {
				defense: S_MED, 
				high: {
					name: "Jab",
					pwr: S_LOW,
					spd: S_HIGH,
					rec: S_MED,
				},
				low: {
					name: "Switch Kick",
					pwr: S_MED,
					spd: S_MED,
					rec: S_MED,
				},
			}
		case C_BUCKET:
		return {
				defense: S_HIGH,
				high: {
					name: "Overhand",
					pwr: S_HIGH,
					spd: S_LOW,
					rec: S_LOW,
				},
				low: {
					name: "Body hook",
					pwr: S_MED,
					spd: S_MED,
					rec: S_LOW,
				},
			}
		case C_WIZARD:
		return {
				defense: S_MED,
				high: {
					name: "Wizard Slap",
					pwr: S_MED,
					spd: S_MED,
					rec: S_MED,
				},
				low: {
					name: "Wizard Kick",
					pwr: S_MED,
					spd: S_MED,
					rec: S_MED,
				},
			}
		case C_KITSUNE:
		return {
				defense: S_LOW,
				high: {
					name: "High chop",
					pwr: S_LOW,
					spd: S_HIGH,
					rec: S_HIGH,
				},
				low: {
					name: "Teep",
					pwr: S_HIGH,
					spd: S_MED,
					rec: S_MED,
				},
			}
		case C_BONE:
		return {
				defense: S_LOW,
				high: {
					name: "Skull Teep",
					pwr: S_HIGH,
					spd: S_LOW,
					rec: S_MED,
				},
				low: {
					name: "Boney Roundhouse",
					pwr: S_HIGH,
					spd: S_LOW,
					rec: S_MED,
				},
			}
		case C_SKELLETREX:
		return {
				defense: S_HIGH,
				high: {
					name: "Skull Crusher",
					pwr: S_MED,
					spd: S_MED,
					rec: S_LOW,
				},
				low: {
					name: "Riblet Buffet",
					pwr: S_HIGH,
					spd: S_LOW,
					rec: S_LOW,
				},
			}
	}
}