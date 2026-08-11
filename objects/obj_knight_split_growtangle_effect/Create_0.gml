image_xscale = 0;
image_yscale = 0;
image_alpha = 0.3;
timer = 0;
maxtimer = 15;
growcon = 1;
image_speed = 0;
image_blend = merge_color(c_green, c_lime, 0.5);
target_angle = 0;
fullgrow = 0;
keep = 0;
megakeep = 0;
maxxscale = 2;
maxyscale = 2;
customBox = false;
init = 0;
spr_custom_box = sprite_index;
sizer = 0;
growscale = 2;

// Above is the original obj_growtangle Create event so it doesnt miss variables

timer = 0;
image_blend = obj_growtangle.image_blend;
image_xscale = obj_growtangle.image_xscale;
image_yscale = obj_growtangle.image_yscale;
surf = -4;
vertical = false;
angle = 0;
xmul = 1;
ymul = 1;
diagonal = false;
