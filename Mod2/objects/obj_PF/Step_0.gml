// Check distance to player
if (!spawned && instance_exists(obj_player)) {
    if (distance_to_object(obj_player) < spawn_distance) {
        spawned = true;
        visible = true; 
    }
}

// The Pop-up Animation
if (spawned) {
    // Smoothly scale up to 1 (0.1 is the speed)
    image_xscale = lerp(image_xscale, 1, 0.1);
    image_yscale = lerp(image_yscale, 1, 0.1);
    
    // Stop calculating once it's basically full size
    if (image_xscale > 0.99) {
        image_xscale = 1;
        image_yscale = 1;
    }
}