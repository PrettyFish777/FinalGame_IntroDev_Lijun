/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

max_stars = 1000;


var num_stars = instance_number(obj_star_transition);

frames_since_star += 1;

if (frames_since_star > frames_bt_star) {
    
    if (num_stars < max_stars) {

        var new_star = instance_create_layer(
            random_range(10, room_width - 50),
            random_range(110, room_height - 50),
            "Instances",
            obj_star1
        );

        with (new_star) {
            var tries = 0;

            while (tries < 3000) {

                var hit = collision_rectangle(
                    x - 20, y - 20,
                    x + 20, y + 20,
                    obj_star_transition,
                    false,
                    true
                );

                if (hit == noone || hit == id) {
                    break;
                }

                x = random_range(1, room_width - 1);
                y = random_range(1, room_height - 1);

                tries += 1;
            }

            if (tries >= 3000) {
                instance_destroy();
            }
        }
    }

    frames_since_star = 0;
}






