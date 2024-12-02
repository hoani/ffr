/// @description Insert description here
// You can write your code in this editor
if ds_map_find_value(async_load, "event_type") == "gamepad discovered" {
	var _index = ds_map_find_value(async_load, "pad_index");
	if _index == 0 {
		connect_gamepad(global.cmd1, _index) 
	}
	if _index == 1 {
		connect_gamepad(global.cmd2, _index)
	}
}