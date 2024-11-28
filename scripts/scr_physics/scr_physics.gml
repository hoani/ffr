// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro GRAVITY 0.5
#macro MAX_YSPD 8


function is_on_floor(){
  return place_meeting(x, y+1, obj_block) || (place_meeting(x, y+1, obj_ledge) && !place_meeting(x, y, obj_ledge))
}

function do_gravity(_s, _max_yspd) {
	if !on_floor {
		vspd += GRAVITY*_s
		if vspd > _max_yspd {
			vspd = _max_yspd
		}
	}
}

function move_block(_s) {
	if place_meeting(x, y+vspd*_s, obj_block) {
		y = round(y)
		var _dist = abs(vspd) + 1
		if vspd > 0 {
			move_contact_solid(270, _dist*_s)
			on_floor = true
			
		} else {
			move_contact_solid(90, _dist*_s)
		}
	
		vspd = 0
	}
	
	if place_meeting(x+hspd*_s, y, obj_block) {
		if hspd > 0 {
			move_contact_solid(0, hspd*_s)
		} else {
			move_contact_solid(180, -hspd*_s)
		}
		hspd = 0
	}
	
	if vspd > 0 && place_meeting(x, y+vspd*_s, obj_ledge)  && !place_meeting(x, y, obj_ledge)  {
		y = round(y)
		var _dist = abs(vspd) + 1
		
		move_contact_solid(270, _dist*_s)
		on_floor = true
		vspd = 0
	}
}
