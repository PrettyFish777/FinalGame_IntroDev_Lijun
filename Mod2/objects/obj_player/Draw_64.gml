if (color_timer <= 120) {
    var _seconds_display = ceil(color_timer / 40);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // UI Position
    var _ui_x = display_get_gui_width() / 2;
    var _ui_y = 50;
    

    var _c = c_white; // Default for "none"
    if (next_color == "Red")   _c = c_red;
    if (next_color == "Green") _c = c_lime;
    if (next_color == "Blue")  _c = c_aqua;
    

    draw_text_transformed_color(_ui_x, _ui_y, string(_seconds_display), 7, 7, 0, _c, _c, _c, _c, 1);
}



//// Key counter

//draw_set_halign(fa_left);
//draw_set_font(fnt_gui); 
//var _str = "Keys: " + string(keys_collected) + " / " + string(keys_total);


//draw_text_color(44, 44, _str, c_black, c_black, c_black, c_black, 1);
//draw_text_color(40, 40, _str, c_yellow, c_yellow, c_yellow, c_yellow, 1);

//// reset. 
//draw_set_font(-1);



var icon_y = 60; // 在 key 下面一点
var icon_gap = 100;
var icon_scale = 1.7; 

var icon1_x = 40;
var icon2_x = icon1_x + icon_gap;
var icon3_x = icon2_x + icon_gap;


// icon 1
if (has_key1) {
    draw_sprite_ext(Blue_Key, 0, icon1_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
} else {
    draw_sprite_ext(B_key_grey, 0, icon1_x, icon_y, icon_scale, icon_scale, 0, c_gray, 1);
}


// icon 2
if (has_key2) {
    draw_sprite_ext(Green_Key, 0, icon2_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
} else {
    draw_sprite_ext(G_key_grey, 0, icon2_x, icon_y, icon_scale, icon_scale, 0, c_gray, 1);
}


// icon 3
if (has_key3) {
    draw_sprite_ext(Red_Key, 0, icon3_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
} else {
    draw_sprite_ext(R_key_grey, 0, icon3_x, icon_y, icon_scale, icon_scale, 0, c_gray, 1);
}