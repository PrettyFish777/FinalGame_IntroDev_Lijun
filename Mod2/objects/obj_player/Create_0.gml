image_speed = 1; 

//movement 
walk_speed = 4;   // How fast you run
jumps_max = 2;    // Double jump

// state 
jumps_left = jumps_max;
color_timer = 180;
current_color = "none"; 

//collsion eehehehe 
mask_index = player; // keeps collision box the same size always


// cemara
cam_width = 1000;
cam_height = 450;
view_enabled = true;
view_visible[0] = true;

// color changing 

next_color = "none" 


// keys 
keys_collected = 0;
keys_total = 3; // The number of keys needed to win


// icons
has_key1 = false;
has_key2 = false;
has_key3 = false;

colliderList = ds_list_create();