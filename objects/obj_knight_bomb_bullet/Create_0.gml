scr_bullet_init();
spin = 0;
spinspeed = 0;
image_alpha = 1;
if (!instance_exists(obj_heart))
{
    instance_destroy();
}
wall_destroy = 1;
bottomfade = 0;
timer = 0;
fadingin = false;
spindir = choose(-1, 1) + random_range(-0.2, 0.2);
image_angle = random_range(0, 360);
image_xscale = 2;
image_yscale = 2;
yspeed = -10;
_gravity = 0.075;
