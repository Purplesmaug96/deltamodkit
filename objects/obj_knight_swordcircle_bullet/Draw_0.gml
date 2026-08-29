if (timer > teleframes) {
	i = max_old - 1;
	while (i > 0)
	{
	    draw_sprite_ext(sprite_index, 0, old_x[i], old_y[i], image_xscale, image_yscale - (0.2 * i), -_direction, c_red, image_alpha - (0.3 * i));
	    i--;
	}
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, -_direction, c_red, 1);
}
else {
	var a = (timer / teleframes);
	var _ease = 0.5 * (1 - cos(pi * a));
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, _ease * image_yscale, -_direction, merge_colour(c_white, c_red, a), max(_ease * 2, 1));
}
