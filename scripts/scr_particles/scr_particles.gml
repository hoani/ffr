// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information






function calculate_count(_count) {
	_count = _count*global.s
	if _count%1 != 0 {
		if random(1) < _count%1 {
			_count = floor(_count) + 1
		} else {
			_count = floor(_count)
		}
	}
	return _count
}