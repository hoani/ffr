// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function new_state(_val){
	return {
		current: _val,
		step: 0,
		mono: 0,
	}
}

function state_set(_state, _val) {
	_state.current = _val
	_state.step = 0
	_state.mono = 0
}

function state_update(_state) {
	_state.step += global.s
	_state.mono++
}

function gamestate() {
	return global.state.current	
}

function gamestate_set(_val) {
	return state_set(global.state, _val)	
}