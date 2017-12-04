/// @function CollisionLineFirst(x1,y1,x2,y2,object,prec,notme)
///
///  @description Returns the instance id of an object colliding with a given line and
///				 closest to the first point, or noone if no instance found.
///				  The solution is found in log2(range) collision checks.
///
/// @param     x1,y2       first point on coll line, real
/// @param     x2,y2       second point on coll line, real
/// @param     object      which objects to look for (or all), real
/// @param     prec        if true, use precise col check, bool
/// @param     notme       if true, ignore calling inst, bool
///
/// GMLscripts.com/license
{
    var ox,oy,dx,dy,object,prec,notme,sx,sy,inst,i;
    ox = argument0;
    oy = argument1;
    dx = argument2;
    dy = argument3;
    object = argument4;
    prec = argument5;
    notme = argument6;
    sx = dx - ox;
    sy = dy - oy;
    inst = collision_line(ox,oy,dx,dy,object,prec,notme);
    if (inst != noone) {
        while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx /= 2;
            sy /= 2;
            i = collision_line(ox,oy,dx,dy,object,prec,notme);
            if (i) {
                dx -= sx;
                dy -= sy;
                inst = i;
            }else{
                dx += sx;
                dy += sy;
            }
        }
    }
    return inst;
}