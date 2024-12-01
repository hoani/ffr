// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro AI_BLOCKING_FACTOR (8) // Higher is less blocking
#macro AI_BLOCKING_MISS_FACTOR (32) // Lower is more misses
#macro AI_BLOCK_FEINTING_FACTOR (16) // Higher is less feinting
#macro AI_FEINTING_FACTOR (128) // Higher is less feinting
#macro AI_EMPTY_BLOCK_FACTOR (128) // Lower is more empty blocking
#macro AI_ATTACK_FACTOR (16) // Higher is more attacking

function new_ai(_f1, _f2, _difficulty) {
	return {
		f1: _f1,
		f2: _f2,
		difficulty: _difficulty, // Expect between 0.25 to 1.0.
	}
}

function ai_block_randomly() {
	if irandom(1) {
		return SIG_LBLK;
	}
	return SIG_HBLK
}

function ai_attack_randomly() {
	if irandom(1) {
		return SIG_LATK;
	}
	return SIG_HATK
}

function ai_block_correctly(_ai) {
	show_debug_message("blocking")
	switch _ai.f1.state.current {
		case FIGHT_HATK_START:
			show_debug_message("blocking high")
			return SIG_HBLK;
		case FIGHT_LATK_START:
			return SIG_LBLK;
	}
	return SIG_NONE;
}

function ai_block_incorrectly(_ai) {
	switch _ai.f1.state.current {
		case FIGHT_HATK_START:
			return SIG_LBLK
		case FIGHT_LATK_START:
			return SIG_HBLK
	}
	return SIG_NONE
}

function ai_attack_opposite(_ai) {
	switch _ai.f1.state.current {
		case FIGHT_HBLK:
			return SIG_LATK
		case FIGHT_LBLK:
			return SIG_HATK
	}
	return SIG_HATK
}

function ai_repeat_attack(_ai) {
	switch _ai.f2.state.current {
		case FIGHT_HATK_START:
			return SIG_HATK
		case FIGHT_LATK_START:
			return SIG_LATK
	}
	return SIG_NONE
}


function get_ai_command(_ai){
	// REACTIVE
	// Check if F1 is attacking and whether to block
	if fighter_attacking(_ai.f1) {
		var _p = fighter_attacking_portion(_ai.f1);
		if random(AI_BLOCKING_FACTOR) < (_p * _ai.difficulty) {
			return ai_block_correctly(_ai)	
		}
		if (random(AI_BLOCKING_MISS_FACTOR/(_ai.difficulty + 1/AI_BLOCKING_MISS_FACTOR)) < 1) {
			// Poorer difficulty levels do bad blocks more frequently
			return ai_block_incorrectly(_ai);
		}
	}
	
	// Check if F1 is blocking and whether to cancel attack.
	if fighter_blocking(_ai.f1) && fighter_attacking(_ai.f2) {
		var _p = fighter_attacking_portion(_ai.f2);
		if random(AI_BLOCK_FEINTING_FACTOR) < _p * _ai.difficulty {
			if irandom(1) == 0 {
				return ai_attack_opposite(_ai)
			} else {
				return ai_repeat_attack(_ai)
			}
		}
	}
	
	// PROACTIVE
	// Check whether attacking and to change attacks
	if fighter_attacking(_ai.f2) {
		if random(AI_FEINTING_FACTOR) < _ai.difficulty {
			if irandom(1) == 0 {
				return ai_attack_opposite(_ai)
			} else {
				return ai_repeat_attack(_ai)
			}
		}
		return SIG_NONE
	}
	// Not attacking
	// Check whether to randomly block
	if (random(AI_EMPTY_BLOCK_FACTOR/(_ai.difficulty + 1/AI_EMPTY_BLOCK_FACTOR)) < 1) {
		// Poorer difficulty levels do empty blocks more frequently
		return ai_block_randomly();
	}
	
	
	// Check whether to randomly attack
	if random(AI_ATTACK_FACTOR) < _ai.difficulty {
		return ai_attack_randomly()
	}
	return SIG_NONE;
}