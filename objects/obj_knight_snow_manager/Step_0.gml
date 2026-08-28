if (!fading)
{
    if (global.turntimer <= 10)
        fading = true;

    if (!fading)
    {
        btimer++;
        if (btimer == rate)
        {
            btimer = 0;
            for (var i = 0; i < bulletcount; i++)
            {
                inst = instance_create(xx + round(random_range(-120, 480)), yy - round(random_range(10, 130)), obj_knight_snow_bullet);
				inst.damage = 60;
            }
        }
    }
}
