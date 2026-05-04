// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_player_collision(player_id, x, y){
	var _vList = ds_list_create();
	var _vCount = instance_place_list(x, y, collider, _vList, false);

	for (var i=0; i<_vCount; i++) {
		var _v = _vList[| i];
		var _n = object_get_name(_v.object_index);
		
		var _valid = player_id.current_color == "none" ||
		    _v.object_index == obj_PF ||
		    _v.object_index == move_PF ||
		    string_pos(player_id.current_color, _n) > 0;
		_valid = _valid && (ds_list_find_index(player_id.colliderList, _v) == -1);
		
		if (_valid) {
			ds_list_destroy(_vList);
			return true;
		}
	}

	ds_list_destroy(_vList);
	return false;
}