// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init_mouseholder(){
	global.mouse_holder = {
		holder: undefined,
		hold: mouse_holder_none,
		release: mouse_holder_none,
	}
}

function mouseholder_update() {
	if mouse_check_button(mb_left) {
		global.mouse_holder.hold(global.mouse_holder.holder)
	}
	if mouse_check_button_released(mb_left) {
		global.mouse_holder.release(global.mouse_holder.holder)
		global.mouse_holder = {
			holder: undefined,
			hold: mouse_holder_none,
			release: mouse_holder_none,
		}
	}
}

function mouseholder_free(_holder) {
	if global.mouse_holder.holder == _holder {
		global.mouse_holder = {
			holder: undefined,
			hold: mouse_holder_none,
			release: mouse_holder_none,
		}
	}
}

function mouseholder_assign(_holder, _hold, _release) {
	if global.mouse_holder.holder == undefined {
		if global.debug {
			show_debug_message("assigned holder to {0}", _holder)
		}
		global.mouse_holder = {
			holder: _holder,
			hold: _hold,
			release: _release,
		}
	}
	if global.debug {
		show_debug_message("unable to assign holder")
	}
}

function mouseholder_available() {
	return global.mouse_holder.holder == undefined
}

function mouse_holder_none(_holder) {}