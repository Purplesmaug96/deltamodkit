if (global.turntimer < 70)
{
    exit;
}
timer++;
if ((timer == rate && swordcount <= maxswords) || (timer == multiswordframes && multiswordcon == 1))
{
	dir = 0;
    for (i = 0; i < swordcount; i++)
    {
		inst = instance_create(x - distance_, y, obj_tracking_sword1);
		inst.direction = dir;
        inst.image_angle = inst.direction + 180;
		inst.aperture = true;
		inst.telegraph = true;
		inst.distance_ = distance_;
		inst.variant = variant;
		inst.damage = damage;
		dir += 360 / swordcount;
    }
    rate -= ratedecay;
    if (rate < rateminimum)
    {
        rate = rateminimum;
    }
    timer = 0;
}
