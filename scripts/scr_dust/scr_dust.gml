// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function new_dust(_s, _scale){
	//cloud
	var _pcloud = part_type_create();
	part_type_sprite(_pcloud, spr_dust_cloud, false, true, true)
	part_type_size(_pcloud, 0.25*_scale, 0.75*_scale, 0.02*_scale, 0);
	part_type_scale(_pcloud, 1, 1);
	part_type_speed(_pcloud, 1*_scale, 4*_scale, 0, 0);
	part_type_direction(_pcloud, 45, 135, 0, 0);
	part_type_gravity(_pcloud, 0, 270);
	part_type_orientation(_pcloud, 0, 360, 0, 0, false);
	part_type_colour3(_pcloud, $FFFFFF, $FFFFFF, $FFFFFF);
	part_type_alpha3(_pcloud, 1, 1, 0);
	part_type_blend(_pcloud, false);
	part_type_life(_pcloud, 16, 16);

	var _ecloud = part_emitter_create(_s);
	

	//base
	var _pbase = part_type_create();
	part_type_sprite(_pbase, spr_dust_ground, false, true, true)
	part_type_size(_pbase, 0.5*_scale, 1.0*_scale, 0.04*_scale, 0);
	part_type_scale(_pbase, 1, 1);
	part_type_speed(_pbase, -2*_scale, 2*_scale, 0, 0);
	part_type_direction(_pbase, 0, 0, 0, 0);
	part_type_gravity(_pbase, 0, 0);
	part_type_orientation(_pbase, 0, 0, 0, 0, false);
	part_type_colour3(_pbase, $FFFFFF, $FFFFFF, $FFFFFF);
	part_type_alpha3(_pbase, 1, 1, 0);
	part_type_blend(_pbase, false);
	part_type_life(_pbase, 10, 10);

	var _ebase = part_emitter_create(_s);

	part_system_position(_s, 0, 0);
	part_system_automatic_update(_s, false)
	
	return {
		s: _s,
		cloud: _pcloud,
		ecloud: _ecloud,
		base: _pbase,
		ebase: _ebase,
		scale: _scale,
	}
}

function dust_destroy(_p) {
	part_type_destroy(_p.cloud)
	part_emitter_destroy(_p.s, _p.ecloud)	
	part_type_destroy(_p.base)	
	part_emitter_destroy(_p.s, _p.ebase)	
}

function dust_emit(_p, _x, _y, _count) {
	_count = calculate_count(_count)
	if _count < 1 {
		return
	}
	
	var _info = part_system_get_info(_p.s)
	
	_x = _x-_info.xorigin
	_y = _y-_info.yorigin
	
	var _xmin = _x-24*_p.scale
	var _xmax = _x+24*_p.scale
	
	part_emitter_region(_p.s, _p.ebase, _xmin, _xmax, _y, _y, ps_shape_line, ps_distr_gaussian);
	part_emitter_burst(_p.s, _p.ebase, _p.base, _count);

	var _ycloud =_y-16*_p.scale
	part_emitter_region(_p.s, _p.ecloud, _xmin, _xmax, _ycloud, _ycloud, ps_shape_line, ps_distr_gaussian);
	part_emitter_burst(_p.s, _p.ecloud, _p.cloud, _count);
}