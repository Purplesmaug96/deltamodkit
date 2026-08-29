timer++;
image_xscale = startscale + min(timer / grow1, maxgrow);
image_yscale = startscale + min(timer / grow1, maxgrow);
draw_self();
