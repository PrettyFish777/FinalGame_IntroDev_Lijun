/// @description Insert description here
// You can write your code in this editor

// --- SETTINGS ---
move_speed = 0.02;   // How fast it moves (smaller is slower)
move_range = 230;    // How many pixels it travels left/right
timer = 0;           // Internal clock for the math

// Store the starting position so it knows where "home" is
start_x = x;
start_y = y;

validCollider = true;
