// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function new_hp(_max, _invulnerable_steps, _on_damage) {
	return {
		current: _max,
		max: _max,	
		invulnerable: 0,
		invulnerable_steps: _invulnerable_steps,
		on_damage: _on_damage,
	}
}

function hp_update(_hp) {
	if _hp.invulnerable > 0 {
		_hp.invulnerable -= global.s
		if _hp.invulnerable < 0 {
			_hp.invulnerable = 0
		}
	}
}

function hp_invulnerable(_hp) {
	return _hp.invulnerable > 0
}

function hp_damage(_hp){
	if _hp.current <= 0 {
		return
	}
	
	if hp_invulnerable(_hp) {
		return 
	}
		
	_hp.current -= 1
	_hp.invulnerable = _hp.invulnerable_steps
	
	_hp.on_damage()
}

function hp_blink(_hp) {
	if hp_invulnerable(_hp) {
		return _hp.invulnerable % 2 >= 1
	}
	return false
}

function hp_draw(_x, _y, _hp, _spr) {
	for (var _i=0; _i <_hp.max; _i++) {
		var _img = _i < _hp.current ? 0 : 1;
		draw_sprite(_spr, _img, _x, _y+_i*8)	
	}
}