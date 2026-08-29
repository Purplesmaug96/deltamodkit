btimer++;
if (btimer == rate)
{
    btimer = 0;
    inst = instance_create(hx, hy, obj_grow_bullet);
	inst.sprite_index = spr_knight_smallbullet;
	inst.grow1 = 30;
	inst.maxgrow = 1;
	inst.damage = 30;
	if (!i_ex(obj_heart)) exit;
	hx = obj_heart.x;
	hy = obj_heart.y;
}
