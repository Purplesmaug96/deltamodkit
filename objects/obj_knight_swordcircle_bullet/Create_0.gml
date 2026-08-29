timer = 0;
con = 0;
scr_bullet_init();
destroyonhit = 0;
wall_destroy = 1;
noenddestroy = true;
_speed = 0;
speedincrease = 0.1;
indicatoralpha = 0.5;
teleframes = 30;
max_old = 3;
old_x[0] = x;
old_y[0] = y;
old_angle[0] = image_angle;
for (i = 1; i < max_old; i++)
{
    old_x[i] = old_x[i - 1];
    old_y[i] = old_y[i - 1];
    old_angle[i] = old_angle[i - 1];
}
image_xscale = 0.75;
image_yscale = 0.75
