// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro CMD_BACK "hk_back"
#macro CMD_FORWARD "hk_forward"
#macro CMD_UP "hk_up"
#macro CMD_DOWN "hk_down"



#macro WASD_UP ord("W")
#macro ZQSD_UP ord("Z")
#macro WASD_LEFT ord("A")
#macro ZQSD_LEFT ord("Q")

#macro WASD_RIGHT ord("D")
#macro WASD_DOWN ord("S")



function commands_continue_check() {
	var _gp_input = gamepad_is_supported() && gamepad_is_connected(0) && (
	gamepad_button_check_pressed(0, gp_start) || 
	gamepad_button_check_pressed(0, gp_select) ||
	gamepad_button_check_pressed(0, gp_face1) || 
	gamepad_button_check_pressed(0, gp_face2) || 
	gamepad_button_check_pressed(0, gp_face3) || 
	gamepad_button_check_pressed(0, gp_face4)
	);
	return _gp_input || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);	
}

function commands_back_check() {
	var _gp_input = gamepad_is_supported() && gamepad_is_connected(0) && (
	gamepad_button_check_pressed(0, gp_shoulderl) || 
	gamepad_button_check_pressed(0, gp_shoulderlb) 
	);
	return _gp_input || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace);	
}
	


function commands_init() {
	var _cmds = {
		checks: {
			CMD_BACK: [],
			CMD_FORWARD: [],
			CMD_UP: [],
			CMD_DOWN: [],
		},
		state: {
			CMD_BACK: {pressed: false, check: false, released: false},
			CMD_FORWARD: {pressed: false, check: false, released: false},
			CMD_UP: {pressed: false, check: false, released: false},
			CMD_DOWN: {pressed: false, check: false, released: false},
		},
		gamepad: -1,
		check: function(_cmd){return false},
		check_pressed: function(_cmd){return false},
		check_released: function(_cmd){return false},
	}
	
	_cmds.check = function(_cmd){return commands_check(_cmds, _cmd)}
	_cmds.check_pressed = function(_cmd){return commands_check_pressed(_cmds, _cmd)}
	_cmds.check_released = function(_cmd){return commands_check_released(_cmds, _cmd)}

	
	return _cmds
}

function commands_reset_registered(_cmds) {
	_cmds.checks = {
			CMD_BACK: [],
			CMD_FORWARD: [],
			CMD_UP: [],
			CMD_DOWN: [],
	}
}

function commands_register_single_player(_cmds) {
	
	commands_reset_registered(_cmds)
	
	commands_register_player_one(_cmds)
	
	commands_register(_cmds, CMD_FORWARD, function(){return keyboard_check(vk_right)});
	commands_register(_cmds, CMD_BACK, function(){return keyboard_check(vk_left)})
	commands_register(_cmds, CMD_UP, function(){return keyboard_check(vk_up)})
	commands_register(_cmds, CMD_DOWN, function(){return keyboard_check(vk_down)})

}

function commands_register_player_one(_cmds) {
	commands_reset_registered(_cmds)
	
	commands_register(_cmds, CMD_BACK, function(){return keyboard_check(WASD_LEFT)});
	commands_register(_cmds, CMD_BACK, function(){return keyboard_check(ZQSD_LEFT)});
	
	commands_register(_cmds, CMD_UP, function(){return keyboard_check(WASD_UP)})
	commands_register(_cmds, CMD_UP, function(){return keyboard_check(ZQSD_UP)})

	commands_register(_cmds, CMD_FORWARD, function(){return keyboard_check(WASD_RIGHT)})
	
	commands_register(_cmds, CMD_DOWN, function(){return keyboard_check(WASD_DOWN)})
}

function commands_register_player_two(_cmds) {
	commands_reset_registered(_cmds)
	
	commands_register(_cmds, CMD_BACK, function(){return keyboard_check(vk_right)});
	commands_register(_cmds, CMD_FORWARD, function(){return keyboard_check(vk_left)})
	commands_register(_cmds, CMD_UP, function(){return keyboard_check(vk_up)})
	commands_register(_cmds, CMD_DOWN, function(){return keyboard_check(vk_down)})
}


function has_controller(_cmds) {
	return _cmds.gamepad != -1
}

function connect_gamepad(_cmds, _device, _index) {
	if _cmds.gamepad != -1 {
		if _device == _index {
			_cmds.gamepad = _device
		}
		return
	}
	
	_cmds.gamepad = _device
	commands_register(_cmds, CMD_BACK, function(){return gamepad_button_check(_cmds.gamepad, gp_padl)});
	commands_register(_cmds, CMD_FORWARD, function(){return gamepad_button_check(_cmds.gamepad, gp_padr)});
	commands_register(_cmds, CMD_UP, function(){return gamepad_button_check(_cmds.gamepad, gp_padu)});
	commands_register(_cmds, CMD_DOWN, function(){return gamepad_button_check(_cmds.gamepad, gp_padd)});
}

function commands_update(_cmds) {
	commands_input_update(_cmds, CMD_BACK);
	commands_input_update(_cmds, CMD_FORWARD);
	commands_input_update(_cmds, CMD_UP);
	commands_input_update(_cmds, CMD_DOWN);
}

function commands_input_update(_cmds, _cmd) {
	var _last = struct_get(_cmds.state, _cmd).check;
	var _check = false;
	var _checks = struct_get(_cmds.checks, _cmd);
	for (var _i=0; _i<array_length(_checks); _i++) {
		_check |= _checks[_i]();
	}
	
	var _pressed = _check && (_last != _check);	
	var _released = !_check && (_last != _check);
	struct_set(_cmds.state, _cmd, {pressed: _pressed, check: _check, released: _released});
}

function commands_register(_cmds, _cmd, _check) {
	var _arr = struct_get(_cmds.checks, _cmd);
	
	array_push(_arr, _check);
	struct_set(_cmds.checks, _cmd, _arr);
}

function commands_check(_cmds, _cmd) {
	return struct_get(_cmds.state, _cmd).check;
}

function commands_check_pressed(_cmds, _cmd) {
	return struct_get(_cmds.state, _cmd).pressed;
}

function commands_check_released(_cmds, _cmd) {
	return struct_get(_cmds.state, _cmd).released;
}

// cmd1 and cmd2 helpers

function cmd1_check(_cmd) {
	return commands_check(global.cmd1, _cmd)
}

function cmd1_pressed(_cmd) {
	return commands_check_pressed(global.cmd1, _cmd);
}

function cmd1_released( _cmd) {
	return commands_check_released(global.cmd1, _cmd);
}

function cmd2_check(_cmd) {
	return commands_check(global.cmd2, _cmd)
}

function cmd2_pressed(_cmd) {
	return commands_check_pressed(global.cmd2, _cmd);
}

function cmd2_released( _cmd) {
	return commands_check_released(global.cmd2, _cmd);
}

