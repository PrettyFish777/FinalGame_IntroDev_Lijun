// --- Step Event ---
if (instance_exists(obj_player)) {
    // 只要玩家离“下一个生成点”不到 2000 像素，就刷出一块
    if (obj_player.x > next_spawn_x - 1500) {
        scr_spawn_chunk();
    }
}