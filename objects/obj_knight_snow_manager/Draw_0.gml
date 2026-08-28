draw_set_fog(true, c_white, 0, 1);
with (obj_knight_snow_bullet)
    draw_self();
draw_set_fog(false, c_black, 0, 0);

if (instance_exists(obj_growtangle))
{
    scr_draw_in_box_begin();
    with (obj_knight_snow_bullet)
        draw_self();
    scr_draw_in_box_end();
}

draw_set_alpha(bgalpha);
draw_rectangle_colour(xx, yy, xx + 640, yy + 480, c2, c2, c_red, c_red, false);
draw_set_alpha(1);

if (timer <= 10 && !fading)
{
    if (bgalpha < 0.5)
        bgalpha += 0.05;
}

if (fading)
{
    if (bgalpha > 0)
        bgalpha -= 0.05;

    if (bgalpha <= 0 && !instance_exists(obj_knight_snow_bullet))
    {
        if (instance_exists(snowbg))
            with (snowbg)
                instance_destroy();
        instance_destroy();
        exit;
    }
}

snowspeed += 5;

timer++;
