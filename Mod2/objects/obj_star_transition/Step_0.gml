life_frames -= 1;

if (life_frames <= 0) {

    if (cloud_type >= 4) {
        exit;
    }

    var _x = x;
    var _y = y;
    var _layer = layer;

    var next_type = cloud_type + 1;
    var next_obj = noone;

    switch (next_type) {
        case 2:
            next_obj = obj_star2;
            break;

        case 3:
            next_obj = obj_star3;
            break;

        case 4:
            next_obj = obj_star4;
            break;
    }

    if (next_obj != noone) {
        var inst = instance_create_layer(_x, _y, _layer, next_obj);
        inst.cloud_type = next_type;
    }

    instance_destroy();
}