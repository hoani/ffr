// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function new_spark(_s){
	
	var _spark = part_type_create();
	part_type_sprite(_spark, spr_spark, false, true, true)
	part_type_size(_spark, 3/32, 3/32, 1/16, 0);
	part_type_scale(_spark, 1, 1);
	part_type_speed(_spark, 0, 0, 0, 0);
	part_type_direction(_spark, 80, 100, 0, 0);
	part_type_gravity(_spark, 0, 270);
	part_type_orientation(_spark, 0, 360, 1, 0, false);
	part_type_colour3(_spark, $FFFFFF, $FFFFFF, $FFFFFF);
	part_type_alpha3(_spark, 1, 1, 0);
	part_type_blend(_spark, false);
	part_type_life(_spark, 12, 12);

	var _espark = part_emitter_create(_s);
	part_emitter_region(_s, _espark, 0, 0, 0, 0, ps_shape_rectangle, ps_distr_linear);
	
	return {
		s: _s,
		spark: _spark,
		espark: _espark,
	}
}

function spark_destroy(_p) {
	part_type_destroy(_p.spark)	
		
	part_emitter_destroy(_p.s, _p.espark)
}

function spark_emit(_p, _x, _y) {
	var _info = part_system_get_info(_p.s)
	
	_x = _x-_info.xorigin
	_y = _y-_info.yorigin
	
	part_emitter_region(_p.s, _p.espark, _x, _x, _y, _y, ps_shape_rectangle, ps_distr_linear);
	
	part_emitter_burst(_p.s, _p.espark, _p.spark, 1);
}