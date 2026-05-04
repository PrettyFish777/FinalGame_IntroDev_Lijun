/*
// --- SETTINGS ---
move_speed = 0.02;   // How fast it moves (smaller is slower)
move_range = 230;    // How many pixels it travels left/right
timer = 0;           // Internal clock for the math

// Store the starting position so it knows where "home" is
start_x = x;
start_y = y;

validCollider = true;

show_debug_message("rocket created at x="+string(x)+", y="+string(y));
*/


// --- SETTINGS ---
move_speed = 0.02;   
move_range = 230;    
timer = 0;           

// 关键改动：先不记录坐标，等第一帧再记录
start_x = 0;
start_y = 0;
initialized = false; 

validCollider = true;