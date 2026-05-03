var _r = keyboard_check(ord("D"));
var _l = keyboard_check(ord("A"));
var _j = keyboard_check_pressed(vk_space);

for (var i = ds_list_size(colliderList) - 1; i >= 0; i--) {
    if (!place_meeting(x, y, colliderList[| i])) {
        ds_list_delete(colliderList, i);
    }
}

// timer - for color 
if (--color_timer <= 0) {
	
	ds_list_destroy(colliderList);
	colliderList = ds_list_create();
	instance_place_list(x, y, collider, colliderList, true);
	
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
if (check_player_collision(id, x, y+y_vel)) {
	if (y_vel > 0) { jumps_left = jumps_max; }
	y_vel = 0;
}

// --- HORIZONTAL COLLISION ---
if (check_player_collision(id, x+x_vel, y)) {
	x_vel = 0;
}

// move
y += y_vel;
x += x_vel;

// jumping 
if (_j && (jumps_left > 0)) { 
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