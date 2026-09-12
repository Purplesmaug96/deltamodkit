timer++;
if ((timer % 3) == 0)
{
    grazed = 0;
}
if (wall_destroy == 1)
{
    if (x < (__view_get(e__VW.XView, 0) - 80))
    {
        instance_destroy();
    }
    if (x > (__view_get(e__VW.XView, 0) + 760))
    {
        instance_destroy();
    }
    if (y < (__view_get(e__VW.YView, 0) - 80))
    {
        instance_destroy();
    }
    if (y > (__view_get(e__VW.YView, 0) + 580))
    {
        instance_destroy();
    }
}
//if (updateimageangle == 1)
//{
//    image_angle = direction;
//}
//if (spin == 1)
//{
//    image_angle += spinspeed;
//}
if (bottomfade != 0)
{
    if (y > (cameray() + bottomfade))
    {
        image_alpha *= 0.8;
    }
}
speed = 0;
yspeed = min(0, yspeed + _gravity);
_gravity += 0.01;
image_angle += (yspeed / 2) * spindir;
y += yspeed;
if (yspeed = 0 && !fadingin) {
	alarm[0] = 30;
	fadingin = true;
	fadeinalpha = 0;
	snd_play(snd_knight_rotatingslash_line);
}
