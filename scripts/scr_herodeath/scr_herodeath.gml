function scr_herodeath(){
	if (variable_instance_exists(id, "_herodeathdone") && _herodeathdone)
		return;
	_herodeathdone = true;
	visible = false;
	var anim = instance_create(x, y, obj_deathanim);
	anim.sprite_index = defeatsprite;
	anim.image_index = 0;
	anim.image_xscale = image_xscale;
	anim.image_yscale = image_yscale;
	anim.dir = -1;
}