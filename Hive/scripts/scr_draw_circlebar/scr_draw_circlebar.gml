/// @description 원형 바 그리기
/// @param x
/// @param y
/// @param value
/// @param valueMax
/// @param radius
/// @param color
/// @param alpha
/// @param width

var _x = argument0;
var _y = argument1;
var value = argument2;
var valueMax = argument3;
var radius = argument4;
var color = argument5;
var alpha = argument6;
var width = argument7

if (value > 0) {
    var numberofsections = 60;
    var sizeofsection = 360 / numberofsections;
    var _value = (value / valueMax) * numberofsections;

    if (_value > 1) {
        circleSuf = surface_create(radius * 2, radius * 2);
        draw_set_color(color);
        draw_set_alpha(alpha);
        
        surface_set_target(circleSuf);
        draw_clear_alpha(c_white, 0);
		
        draw_primitive_begin(pr_trianglefan);
        draw_vertex(radius, radius);
        
        for (var i = 0; i <= _value; i++) {
            var len = (i * sizeofsection) + 90;
            var tx = lengthdir_x(radius, len);
            var ty = lengthdir_y(radius, len);
            draw_vertex(radius + tx, radius + ty);
        }
        draw_primitive_end();
        draw_set_alpha(1);
        
        gpu_set_blendmode(bm_subtract);
        draw_set_color(c_black);
        draw_circle(radius - 1, radius - 1, radius - width, false);
		
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
     
        draw_surface(circleSuf, _x - radius, _y - radius);
        surface_free(circleSuf);
    }
}