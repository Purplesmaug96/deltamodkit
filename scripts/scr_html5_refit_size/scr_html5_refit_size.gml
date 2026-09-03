function scr_html5_refit_size()
{
    if (global.is_native) return;
    
    var disp_width = browser_width;
    var disp_height = browser_height;
    
    var aspect_ratio = disp_width / disp_height;
    if (aspect_ratio > 4 / 3)
        disp_width = disp_height * 4 / 3;
    else
        disp_height = disp_width * 3 / 4;
    
    window_set_size(disp_width, disp_height);
}
