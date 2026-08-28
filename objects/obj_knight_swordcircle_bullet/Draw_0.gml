if (timer > teleframes) {
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, -_direction, c_white, 1);
}
else {
	var _ease = 0.5 * (1 - cos(pi * (timer / teleframes)));
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, _ease * image_yscale, -_direction, c_white, 1);
}
