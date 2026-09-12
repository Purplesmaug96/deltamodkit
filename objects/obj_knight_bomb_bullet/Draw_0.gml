if (fadingin) {
	image_blend = merge_colour(c_white, c_red, fadeinalpha);
	fadeinalpha = min(1, fadeinalpha + 1 / 30);
}
draw_self();