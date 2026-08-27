if (global.is_native && window_get_fullscreen())
{
    window_set_fullscreen(false);
    ini_open("true_config.ini");
    ini_write_real("SCREEN", "FULLSCREEN", 0);
    ini_close();
    window_set_size(640 * window_size_multiplier, 480 * window_size_multiplier);
    alarm[2] = 1;
}
else
{
	if (!global.is_native) {
		var disp_width = display_get_width();
	    var disp_height = display_get_height();
		
	    var aspect_ratio = disp_width / disp_height;
	    if (aspect_ratio > 4/3) {
	        disp_width = disp_height * 4/3;
	    }
	    else {
	        disp_height = disp_width * 3/4;
	    }
    
	    if (surface_exists(application_surface)) {
	        surface_free(application_surface);
	    }
	    surface_resize(application_surface, disp_width, disp_height);
		
		var center_x = (display_get_width() - disp_width) / 2;
	    var center_y = (display_get_height() - disp_height) / 2;
	    window_set_position(center_x, center_y);
    
		window_set_size(disp_width, disp_height);
	}
    window_set_fullscreen(true);
    ini_open("true_config.ini");
    ini_write_real("SCREEN", "FULLSCREEN", 1);
    ini_close();
}

fullscreen_toggle = 0;
