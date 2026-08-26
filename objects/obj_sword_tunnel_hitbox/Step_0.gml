timer++;
if (timer == 2)
{
    active = 1;
    if (global.inv < 0 && grazed == 0)
    {
        if (collision_line(x, y, x + lengthdir_x(1998, image_angle), y + lengthdir_y(1998, image_angle), obj_grazebox, false, true))
        {
            grazed = 1;
            scr_tensionheal(grazepoints);
            with (obj_battlecontroller)
            {
                grazenoise = 1;
            }
            with (obj_grazebox)
            {
                grazetimer = 10;
            }
        }
    }
}
if (timer == 3)
{
    instance_destroy();
}
