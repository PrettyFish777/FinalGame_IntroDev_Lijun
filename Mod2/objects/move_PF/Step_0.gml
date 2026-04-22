// 1. Move the platform (Sine wave)
timer += move_speed;
var _old_x = x;
x = start_x + (sin(timer) * move_range);
var _h_speed = x - _old_x; 

// 2. Universal Carrying Logic
// We check for the player 2 pixels above the platform
var _p = instance_place(x, y - 2, obj_player);

if (_p != noone) {
    // We REMOVED the color check here so it works for ALL colors
    with(_p) {
        // Only move the player if they aren't about to hit a wall
        if (!place_meeting(x + _h_speed, y, obj_PF)) {
            x += _h_speed;
        }
    }
}