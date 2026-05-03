// --- Create Event ---
chunks = [Sequence1, Sequence2, Sequence3];
chunk_width = 1800; 
next_spawn_x = 4000; 

scr_spawn_chunk = function() {
    var _index = irandom(array_length(chunks) - 1);
    var _selected = chunks[_index];
    var _lay_id = layer_get_id("Instances");
    
    if (_lay_id != -1) {
        // 创建 Sequence 并获取它的 ID
        var _new_seq = layer_sequence_create(_lay_id, next_spawn_x, 0, _selected);
        
		/*
        // 【新增代码】强制刷新 Sequence 的播放状态
        layer_sequence_headpos(_new_seq, 0); 
        layer_sequence_play(_new_seq);
   
		var _new_seq = layer_sequence_create(_lay_id, next_spawn_x, 0, _selected);
		// 获取这个 Sequence 产生的所有实例
		var _instances = layer_sequence_get_instance(_new_seq);
		// 强制让 Sequence 处于播放状态
		layer_sequence_play(_new_seq);
		*/
    }
    
    next_spawn_x += chunk_width;
}