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



// Key counter

draw_set_halign(fa_left);
draw_set_font(fnt_gui); 
var _str = "Keys: " + string(keys_collected) + " / " + string(keys_total);


draw_text_color(44, 44, _str, c_black, c_black, c_black, c_black, 1);
draw_text_color(40, 40, _str, c_yellow, c_yellow, c_yellow, c_yellow, 1);

// reset. 
draw_set_font(-1);