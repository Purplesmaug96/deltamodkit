if (global.inv < 0 && grazed == 0)
{
    var _hx = obj_heart.x + 10;
    var _hy = obj_heart.y + 10;
    var _ldx = lengthdir_x(1, direction);
    var _ldy = lengthdir_y(1, direction);
    var _rx = _hx - x;
    var _ry = _hy - y;
    var _t = (_rx * _ldx) + (_ry * _ldy);
    if (_t >= -30 && _t <= 930)
    {
        var _px = x + (_ldx * _t);
        var _py = y + (_ldy * _t);
        if (point_distance(_hx, _hy, _px, _py) < 24)
        {
            grazed = 1;
            var _grazetpfactor = 1;
            var _grazetimefactor = 1;
            scr_tensionheal(grazepoints * _grazetpfactor);
            if (global.turntimer >= 10)
                global.turntimer -= ((timepoints / 30) * _grazetimefactor);
            with (obj_battlecontroller)
            {
                grazenoise = 1;
            }
            with (obj_grazebox)
            {
                grazetimer = 10;
                grazecount++;
            }
        }
    }
}
exit;
