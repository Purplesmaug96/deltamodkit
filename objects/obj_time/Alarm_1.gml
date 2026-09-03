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
		scr_html5_refit_size();
	}
    window_set_fullscreen(true);
    ini_open("true_config.ini");
    ini_write_real("SCREEN", "FULLSCREEN", 1);
    ini_close();
}

fullscreen_toggle = 0;
