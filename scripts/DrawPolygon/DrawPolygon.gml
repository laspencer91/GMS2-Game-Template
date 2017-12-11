/// @description Draw a polygon of n number of sides using a "thickness". The polygon will be empty.
///			     To create a solid polygon the thickness should be the same value as the radius.
/// @function DrawPolygon
/// @param centerX real
/// @param centerY real
/// @param points real
/// @param radius real
/// @param rot real
/// @param thickness real
/// @param color real

var _centerX     = argument0;
var _centerY     = argument1;
var _points		 = argument2;
var _radius		 = argument3;
var _rot		 = argument4;
var _thickness   = argument5;
var _color       = argument6;

draw_set_color(_color);

dirIncrement = 360 / _points;

draw_primitive_begin(pr_trianglestrip);

for (var _i = 0; _i < _points + 1; _i++)
{
	draw_vertex(_centerX + lengthdir_x(_radius, _rot + dirIncrement * _i), 
			    _centerY + lengthdir_y(_radius, _rot + dirIncrement * _i));
	draw_vertex(_centerX + lengthdir_x(_radius - _thickness, _rot + dirIncrement * _i), 
			    _centerY + lengthdir_y(_radius - _thickness, _rot + dirIncrement * _i));
}

draw_primitive_end();

draw_set_color(c_white);
