// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro PLAYER_ONE 0
#macro PLAYER_TWO 1

function player_init(){
	global.p1 = C_HOANI
	global.p2 = C_HOANI
	global.winner = PLAYER_ONE
}

function iwinner() {
	if global.winner == PLAYER_ONE {
		return global.p1
	} else {
		return global.p2
	}
}

function pwinner() {
	if global.winner == PLAYER_ONE {
		return p1()
	} else {
		return p2()
	}
}

function ploser() {
	if global.winner == PLAYER_ONE {
		return p2()
	} else {
		return p1()
	}
}

function p1() {
	return global.c[global.p1]
}

function spr_p1() {
	return p1().spr
}

function snd_p1_name() {
	return snd_name(global.p1)
}

function p1_select_next() {
	global.p1 = p_get_next(global.p1)
}

function p1_select_prev() {
	global.p1 = p_get_prev(global.p1)
}


function p2() {
	return global.c[global.p2]
}

function spr_p2() {
	return p2().spr
}

function snd_p2_name() {
	return snd_name(global.p2)
}

function p2_select_next() {
	global.p2 = p_get_next(global.p2)
}

function p2_select_prev() {
	global.p2 = p_get_prev(global.p2)
}

function p_get_next(_p) {
	_p++ 
	if _p >= C_TOTAL {
		_p -= C_TOTAL
	}
	if _p == C_SKELLETREX && global.singleplayer {
		_p = p_get_next(_p)	
	}
	return _p
}

function p_get_prev(_p) {
	_p--
	if _p < 0 {
		_p += C_TOTAL
	}
	if _p == C_SKELLETREX && global.singleplayer {
		_p = p_get_prev(_p)	
	}
	return _p
}
