// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function prefetch_group(_name){
	var _tex_array = texturegroup_get_textures(_name);
	for (var _i = 0; _i < array_length(_tex_array); ++_i;)
	{
		texture_prefetch(_tex_array[_i]);
	}
}

function prefetch_character(_which){
	switch _which {
		case C_HOANI:
			prefetch_group("hoani");
			break
		case C_BUCKET:
			prefetch_group("bucket");
			break
		case C_KITSUNE:
			prefetch_group("kitsune");
			break
		case C_WIZARD:
			prefetch_group("wizard")
			break
		case C_BONE:
			prefetch_group("bone");
			break
		case C_SKELLETREX:
			prefetch_group("skelletrex")
			break
	}
}