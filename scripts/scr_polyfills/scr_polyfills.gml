/// @func array_foreach(arr, func)
/// @arg 0 arr   // source array
/// @arg 1 func  // function(element, index)
function arr_foreach(arr, func) {
    var n = array_length(arr);
    for (var i = 0; i < n; ++i) {
        func(arr[i], i);
    }
}

/// @func array_find_index(arr, predicate)
/// @arg 0 arr        // 1D array
/// @arg 1 predicate  // function(element, index) → bool
function arr_find_index(arr, predicate) {
    var n = array_length(arr);
    for (var i = 0; i < n; ++i) {
        if (predicate(arr[i], i)) return i;
    }
    return -1;
}

/// @func array_contains(arr, value)
/// @arg 0 arr        // 1D array
/// @arg 1 value      // value to look for
function arr_contains(arr, value) {
    if (!is_array(arr)) {
        return false;
    }
    
    var len = array_length(arr);
    for (var i = 0; i < len; i++) {
        var item = arr[i];
        if (item == value) {
            return true;
        }
    }
	
    return false;
}


/// @func array_push(arr, ...)
/// @arg 0 arr        // 1D array
/// @arg 1+ ...       // values to append
function arr_push(arr) {
    for (var k = 1; k < argument_count; ++k) {
        array_push(arr, argument[k]);
    }
}

/// @func array_pop(arr)
/// @arg 0 arr        // 1D array
function arr_pop(arr) {
    var len = array_length(arr);
    if (len <= 0) return undefined;
    var val = arr[len-1];
    array_resize(arr, len-1);
    return val;
}

function arr_length(arr) { return array_length(arr); }

// string
function stringsetloc(str, code) { return str; }
/// @func stringsetsubloc(string, ..., localizationkey)
/// @arg 0 englishstring
/// @arg 1+ replacements
function stringsetsubloc() {
	var len = argument_count;
    var args;
    
    for (var i = 0; i < len; i++)
        args[i] = argument[i];
    
    var str = script_execute_ext(stringsetsub, args);
    return str;
}

// --- Deltarune bullet helpers (ported from real game, for knight attacks) ---

function scr_childbullet()
{
	var __child = instance_create(argument[0], argument[1], argument[2]);
	var __parent = (argument_count == 4) ? argument[3] : id;
	if (__parent.damage != -1)
		__child.damage = __parent.damage;
	if (__parent.grazepoints != -1)
		__child.grazepoints = __parent.grazepoints;
	if (__parent.timepoints != -1)
		__child.timepoints = __parent.timepoints;
	if (__parent.inv != -1)
		__child.inv = __parent.inv;
	if (__parent.target != -1)
		__child.target = __parent.target;
	if (__parent.grazed != -1)
		__child.grazed = __parent.grazed;
	if (__parent.grazetimer != -1)
		__child.grazetimer = __parent.grazetimer;
	__child.element = __parent.element;
	return __child;
}

function scr_rotatetowards(arg0, arg1, arg2)
{
	var __diff = angle_difference(arg1, arg0);
	if (abs(__diff) > arg2)
		return arg0 + (sign(__diff) * arg2);
	else
		return arg1;
}

function scr_angle_lerp(arg0, arg1, arg2)
{
	var __diff = angle_difference(arg1, arg0);
	return arg0 + lerp(0, __diff, arg2);
}

function scr_custom_afterimage(arg0)
{
	afterimage = instance_create(x, y, arg0);
	afterimage.sprite_index = sprite_index;
	afterimage.image_index = image_index;
	afterimage.image_blend = image_blend;
	afterimage.image_speed = 0;
	afterimage.depth = depth + 1;
	afterimage.image_xscale = image_xscale;
	afterimage.image_yscale = image_yscale;
	afterimage.image_angle = image_angle;
	return afterimage;
}

function scr_draw_outline(arg0, arg1, arg2)
{
	draw_set_fog(true, arg1, 0, 0);
	var __xdirA = arg0;
	var __xdirB = 0;
	var __ydirA = 0;
	var __ydirB = arg0;
	if ((image_angle % 90) != 0)
	{
		__xdirA = lengthdir_x(arg0, image_angle);
		__xdirB = lengthdir_x(arg0, image_angle + 90);
		__ydirA = lengthdir_y(arg0, image_angle + 90);
		__ydirB = lengthdir_y(arg0, image_angle);
	}
	draw_sprite_ext(sprite_index, image_index, x + __xdirA, y + __ydirA, image_xscale, image_yscale, image_angle, c_white, image_alpha * arg2);
	draw_sprite_ext(sprite_index, image_index, x - __xdirA, y - __ydirA, image_xscale, image_yscale, image_angle, c_white, image_alpha * arg2);
	draw_sprite_ext(sprite_index, image_index, x + __xdirB, y + __ydirB, image_xscale, image_yscale, image_angle, c_white, image_alpha * arg2);
	draw_sprite_ext(sprite_index, image_index, x - __xdirB, y - __ydirB, image_xscale, image_yscale, image_angle, c_white, image_alpha * arg2);
	draw_set_fog(false, c_white, 0, 0);
}

function scr_pingpong(arg0, arg1)
{
	if (arg1 == 0)
		return arg0;
	var __value = scr_loop(arg0, arg1 * 2);
	if (__value > arg1)
		__value = (arg1 * 2) - __value;
	return __value;
}

function scr_pingpong_ext(arg0, arg1, arg2)
{
	var __value = scr_loop_ext(arg0, arg1, arg2);
	if (__value > (arg1 + arg2) / 2)
		__value = arg1 + arg2 - __value;
	return __value;
}

function scr_loop(arg0, arg1)
{
	var __result = arg0;
	if (__result < 0)
		__result = arg1 - (-__result % arg1);
	else if (__result >= arg1)
		__result = __result % arg1;
	return __result;
}

function scr_loop_ext(arg0, arg1, arg2)
{
	var __result = arg0;
	var __range = arg2 - arg1;
	while (__result < arg1)
		__result += __range;
	while (__result > arg2)
		__result -= __range;
	return __result;
}

function scr_precise_hit(arg0 = 3, arg1 = false)
{
	arg0 /= 2;
	var _hx = obj_heart.x + 10;
	var _hy = obj_heart.y + 10;
	if (arg0 <= 0)
		return collision_point(_hx, _hy, id, true, false);
	else if (arg1)
		return collision_circle(_hx, _hy, arg0, id, true, false);
	else
		return collision_rectangle(_hx - arg0, _hy - arg0, _hx + arg0, _hy + arg0, id, true, false);
}

function Vector2(arg0 = 0, arg1 = 0) constructor
{
	static add = function(arg0)
	{
		x += arg0.x;
		y += arg0.y;
	};
	
	static scale = function(arg0)
	{
		x *= arg0.x;
		y *= arg0.y;
	};
	
	x = arg0;
	y = arg1;
	
	direction = function(arg0, arg1)
	{
		return point_direction(0, 0, arg0, arg1);
	};
	
	magnitude = function(arg0, arg1)
	{
		return point_distance(0, 0, arg0, arg1);
	};
	
	normalized = function(arg0, arg1)
	{
		var __len = point_distance(0, 0, arg0, arg1);
		if (arg0 == 0 && arg1 == 0)
			return new Vector2();
		return new Vector2(arg0 / __len, arg1 / __len);
	};
}

function getxy(arg0)
{
	return new Vector2(arg0.x, arg0.y);
}

function setxy_v2(arg0)
{
	x = arg0.x;
	y = arg0.y;
}

function scr_rotatevector(arg0, arg1)
{
	if (arg1 == 0)
		return arg0;
	var _dir = point_direction(0, 0, arg0.x, arg0.y);
	var _len = point_distance(0, 0, arg0.x, arg0.y);
	arg0.x = lengthdir_x(_len, _dir + arg1);
	arg0.y = lengthdir_y(_len, _dir + arg1);
	return arg0;
}

function scr_rotatevector_xy(arg0, arg1, arg2)
{
	var _tempVector = 
	{
		x: arg0,
		y: arg1
	};
	if (arg2 == 0)
		return _tempVector;
	var _dir = point_direction(0, 0, arg0, arg1);
	var _len = point_distance(0, 0, arg0, arg1);
	_tempVector.x = lengthdir_x(_len, _dir + arg2);
	_tempVector.y = lengthdir_y(_len, _dir + arg2);
	return _tempVector;
}

function scr_dir_to_vector(arg0)
{
	var __dir = arg0[0];
	var __len = 1;
	if (argument_count > 1)
		__len = arg0[1];
	return new Vector2(lengthdir_x(__dir, __len), lengthdir_y(__dir, __len));
}

function scr_rotatevector_around(arg0, arg1, arg2)
{
	var __dir = Vector2_direction(arg1, arg0);
	var __len = Vector2_distance(arg1, arg0);
	arg0.x = arg1.x + lengthdir_x(__len, __dir + arg2);
	arg0.y = arg1.y + lengthdir_y(__len, __dir + arg2);
	return arg0;
}

function Vector2_distance(arg0, arg1)
{
	return point_distance(arg0.x, arg0.y, arg1.x, arg1.y);
}

function Vector2_direction(arg0, arg1)
{
	return point_direction(arg0.x, arg0.y, arg1.x, arg1.y);
}

function scr_draw_beam(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
	var __xx = arg0;
	var __yy = arg1;
	var _end0 = scr_rotatevector(new Vector2(arg2), arg4);
	_end0.x += __xx;
	_end0.y += __yy;
	var _end1 = scr_rotatevector(new Vector2(arg2), arg4 + (arg3 / 2));
	_end1.x += __xx;
	_end1.y += __yy;
	var _end2 = scr_rotatevector(new Vector2(arg2), arg4 - (arg3 / 2));
	_end2.x += __xx;
	_end2.y += __yy;
	draw_set_color(arg5);
	var __alpha = draw_get_alpha();
	draw_set_alpha(arg6);
	if (arg7)
		draw_circle(_end0.x, _end0.y, arg3 / 2, 0);
	draw_triangle(__xx, __yy, _end1.x, _end1.y, _end2.x, _end2.y, 0);
	draw_set_alpha(__alpha);
}

function scr_draw_beam_color(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
	var __xx = arg0;
	var __yy = arg1;
	var _end0 = scr_rotatevector(new Vector2(arg2), arg4);
	_end0.x += __xx;
	_end0.y += __yy;
	var _end1 = scr_rotatevector(new Vector2(arg2), arg4 + (arg3 / 2));
	_end1.x += __xx;
	_end1.y += __yy;
	var _end2 = scr_rotatevector(new Vector2(arg2), arg4 - (arg3 / 2));
	_end2.x += __xx;
	_end2.y += __yy;
	var __alpha = draw_get_alpha();
	draw_set_alpha(arg7);
	if (arg8)
		draw_circle(_end0.x, _end0.y, arg3 / 2, 0);
	draw_triangle_color(__xx, __yy, _end1.x, _end1.y, _end2.x, _end2.y, arg5, arg6, arg6, 0);
	draw_set_alpha(__alpha);
}

function gt_maxx()
{
	if (instance_exists(obj_growtangle))
		return obj_growtangle.x + (obj_growtangle.sprite_width / 2);
}