
// --- SETTINGS ---
move_speed = 0.02;   // How fast it moves (smaller is slower)
move_range = 230;    // How many pixels it travels left/right
timer = 0;           // Internal clock for the math

// Store the starting position so it knows where "home" is
start_x = x;
start_y = y;

validCollider = true;



/*
// --- SETTINGS ---
move_speed = 0.02;   
move_range = 230;    
timer = 0;           

// 关键改动：先不记录坐标，等第一帧再记录
start_x = 0;
start_y = 0;
initialized = false; 

validCollider = true;

// 告诉 Sequence：这个实例的坐标，别听 Sequence 的，听它自己代码的
// element_id 是内置变量，代表当前物体在 Sequence 中的身份
if (variable_instance_exists(self, "element_id")) {
    layer_sequence_instance_override_object(layer_sequence_get_instance(self.element_id), object_index, self.id);
}


/*