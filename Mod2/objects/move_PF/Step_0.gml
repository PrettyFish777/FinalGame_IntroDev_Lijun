if (!initialized) {
    start_x = x;
    start_y = y;
    if (start_x != 0 || start_y != 0) {
        initialized = true;
    }
} else {
	// 1. Move the platform (Sine wave)
	timer += move_speed;
	var _old_x = x;
	x = start_x + (sin(timer) * move_range);
	var _h_speed = x - _old_x; 

	// 2. Universal Carrying Logic
	// We check for the player 2 pixels above the platform
	var _p = instance_place(x, y - 2, obj_player);

	if (_p != noone) {
	    with(_p) {
	        // Only move the player if they aren't about to hit a wall
	        if (!check_player_collision(id, x + _h_speed, y)) {
	            x += _h_speed;
	        }
	    }
	}
}