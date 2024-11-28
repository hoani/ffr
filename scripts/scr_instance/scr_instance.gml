// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_create_back(_x, _y, _obj, _struct={}){
	return instance_create_layer(_x, _y, "back", _obj, _struct)
}

function instance_create(_x, _y, _obj, _struct={}){
	return instance_create_layer(_x, _y, "world", _obj, _struct)
}

function instance_create_ui(_x, _y, _obj, _struct={}){
	return instance_create_layer(_x, _y, "ui", _obj, _struct)
}