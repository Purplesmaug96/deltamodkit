bgalpha = 0;
c2 = merge_colour(c_red, c_black, 0.8); // 80% red, 20% black
timer = 0;
btimer = 0;
snowspeed = 0;
rate = 1;
bulletcount = 1;
xx = camerax();
yy = cameray();

noenddestroy = true;
fading = false;
if (instance_exists(obj_growtangle))
    depth = obj_growtangle.depth - 50;
snowbg = instance_create(xx, yy, obj_knight_snow_bg);
snowbg.depth = depth + 100;