/// @description Insert description here
// You can write your code in this editor

last_step = global.step

// back absolute particles
ba = part_system_create()
part_system_automatic_update(ba, false)
part_system_depth( ba, 9 );

// front absolute particles
fa = part_system_create()
part_system_automatic_update(fa, false)
part_system_depth( fa, -9 );


b_dust = new_dust(ba, 2/16)
f_dust = new_dust(fa, 2/16)
impact_dust = new_dust(ba, 3/16)