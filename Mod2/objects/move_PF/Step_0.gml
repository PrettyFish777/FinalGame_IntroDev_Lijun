
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



/*
// --- 逻辑 1：捕捉家在哪里 ---
if (!initialized) {
    // 即使 Sequence 想把它弄回 (0,0)，在第一帧它被创建时，
    // 它其实是处在你在编辑器里摆放的那个位置的。
    start_x = x;
    start_y = y;
    
    // 如果发现抓到的是 0，说明还没准备好，下一帧再抓
    if (start_x != 0 || start_y != 0) {
        initialized = true;
    }
}

// --- 逻辑 2：移动（只有初始化后才执行） ---
if (initialized) {
    timer += move_speed;
    var _old_x = x;
    
    // 关键：绝对赋值，不给 Sequence 往回拉的机会
    x = start_x + (sin(timer) * move_range);
    
    var _h_speed = x - _old_x; 

    // --- 逻辑 3：带人移动 ---
    var _p = instance_place(x, y - 2, obj_player);
    if (_p != noone) {
        with(_p) {
            if (!place_meeting(x + _h_speed, y, obj_PF)) {
                x += _h_speed;
            }
        }
    }
}



// 2. 移动平台 (Sine wave)
timer += move_speed;
var _old_x = x;
x = start_x + (sin(timer) * move_range);
var _h_speed = x - _old_x; 

// 3. 玩家跟随逻辑
var _p = instance_place(x, y - 2, obj_player);

if (_p != noone) {
    with(_p) {
        // 如果玩家前方没有墙，就带着玩家走
        if (!place_meeting(x + _h_speed, y, obj_PF)) {
            x += _h_speed;
        }
    }
}



/*
