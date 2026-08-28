if (btimer == rate)
{
    btimer = 0;
    for (var i = 0; i < bulletcount; i++)
    {
		var angle = ((angle_end - angle_start) / bulletcount) * i;
		var xxx = obj_heart.x;
		var yyy = obj_heart.y;
		xxx -= cos(degtorad(angle)) * start_distance;
		yyy -= sin(degtorad(angle)) * start_distance;
        inst = instance_create(xxx, yyy, obj_knight_swordcircle_bullet);
		inst.damage = 60;
		inst.direction = angle;
		inst._direction = angle;
    }
	rate -= 5;
}
btimer++;
