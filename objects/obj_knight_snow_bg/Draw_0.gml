if (instance_exists(obj_knight_snow_manager))
{
    var mgr = obj_knight_snow_manager;
    draw_set_alpha(mgr.bgalpha);
    draw_sprite_tiled_ext(bg_snowfall, 0, mgr.snowspeed / 1.5 / 2, mgr.timer * 3, 1.5, 1.5, c_white, mgr.bgalpha / 4);
    draw_sprite_tiled_ext(bg_snowfall, 0, mgr.snowspeed / 2, mgr.timer * 4, 1.5, 1.5, c_white, mgr.bgalpha / 2);
    draw_set_alpha(1);
}
else
{
    instance_destroy();
}
