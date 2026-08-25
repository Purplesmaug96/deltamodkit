draw_self();
if (con == 0)
{
    whitealpha += fadeSpeed;
}
if (whitealpha >= 1)
{
    con = 1;
    whitealpha = 1;
    image_alpha = 0;
}
if (con == 1)
{
    whitealpha -= fadeSpeed;
    if (whitealpha < 0)
    {
        instance_destroy();
    }
}
draw_set_fog(true, c_white, 0, 1);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, whitealpha);
draw_set_fog(false, c_black, 0, 0);
