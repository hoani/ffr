// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animate(_start, _count, _frames, _step){
	var _offset = floor((_step % (_frames * _count))/(_frames))
	return _start + _offset;
}