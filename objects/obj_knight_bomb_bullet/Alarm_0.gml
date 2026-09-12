for (var i = 0; i < 16; i++) {
	with (scr_fire_bullet(x, y, obj_regularbullet, (360 / 16) * i + random_range(-5, 5), random_range(8, 10), spr_diamondbullet_form)) {
		grazepoints = 3;
		damage = 60;
		element = 5;
		image_angle = direction;
		image_blend = c_red;
		friction = random_range(0.05, 0.075);
	}
}
snd_play(choose(snd_knight_cut, snd_knight_cut2));
instance_destroy();
