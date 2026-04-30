var _r = keyboard_check(ord("D"));
var _l = keyboard_check(ord("A"));
var _j = keyboard_check_pressed(vk_space);


// timer - for color 
if (--color_timer <= 0) {
    
    current_color = next_color;
 
    color_timer = room_speed * random_range(3, 6);
    
    var _new_pick = current_color; 

    while (_new_pick == current_color) {
        var _p = irandom(3);
        _new_pick = (_p == 0) ? "none" : (_p == 1 ? "Red" : (_p == 2 ? "Green" : "Blue"));
    }
    
    next_color = _new_pick;
}


// sound  
if (color_timer == 120 || color_timer == 80 || color_timer == 40) {
    audio_play_sound(snd_warning, 1, false);
}


// movement 
x_vel = (_r - _l) * walk_speed;
y_vel += grav;


// --- VERTICAL COLLISION ---
var _v = instance_place(x, y + y_vel, obj_PF);
if (_v == noone) _v = instance_place(x, y + y_vel, move_PF); 

if (_v != noone) {
    var _n = object_get_name(_v.object_index);

    if (
        current_color == "none" ||
        _v.object_index == obj_PF ||
        _v.object_index == move_PF ||
        string_pos(current_color, _n) > 0
    ) {
        while (!place_meeting(x, y + sign(y_vel), _v)) {
            y += sign(y_vel);
        }

        y_vel = 0;
        jumps_left = jumps_max;
    }
}

y += y_vel;


// --- HORIZONTAL COLLISION ---
var _h = instance_place(x + x_vel, y, obj_PF);
if (_h == noone) _h = instance_place(x + x_vel, y, move_PF);

if (_h != noone) {
    var _nh = object_get_name(_h.object_index);

    if (
        current_color == "none" ||
        _h.object_index == obj_PF ||
        _h.object_index == move_PF ||
        string_pos(current_color, _nh) > 0
    ) {
        while (!place_meeting(x + sign(x_vel), y, _h)) {
            x += sign(x_vel);
        }

        x_vel = 0;
    }
}

x += x_vel;


// jumping 
if (_j && jumps_left > 0) { 
    y_vel = bounce_vel; 
    jumps_left--; 
}


// animation 
var _act = "player";

if (!place_meeting(x, y + 1, obj_PF) && !place_meeting(x, y + 1, move_PF)) {
    _act = (y_vel < 0) ? "jump" : "drop";
} else if (x_vel != 0) {
    _act = "walk";
}


// sprite / color
var _name = (current_color == "none") ? "player" : current_color + "_" + _act;

if (current_color == "none" && _act != "player") {
    _name = "player_" + _act;
}

var _s = asset_get_index(_name);
if (_s != -1) {
    sprite_index = _s;
}

if (x_vel != 0) {
    image_xscale = sign(x_vel);
}


// DEATH
if (y > room_height) {
    if (!audio_is_playing(snd_death)) {
        audio_play_sound(snd_death, 10, false);
    }

    room_restart();
}


// KEY COLLECTION LOGIC 
var _inst = instance_place(x, y, P_keys);

if (_inst != noone) {
 
    audio_play_sound(snd_key_pickup, 1, false);
	
    if (_inst.object_index == obj_BlueKey) {
        has_key1 = true;
    }

    if (_inst.object_index == obj_GreenKey) {
        has_key2 = true;
    }

    if (_inst.object_index == obj_RedKey) {
        has_key3 = true;
    }

    keys_collected += 1;
    
    instance_destroy(_inst);
    
    if (keys_collected >= keys_total) {
        audio_stop_all(); 
        room_goto(Room2);
    }
}


// CAMERA
var _target_x = x - (cam_width / 2);
var _target_y = 0; 

_target_x = clamp(_target_x, 0, room_width - cam_width);

camera_set_view_pos(view_camera[0], _target_x, _target_y);