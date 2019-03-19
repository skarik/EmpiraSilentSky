
if (fxLife > 1.0)
{
    draw_set_color(c_electricity);
    draw_circle(x+choose(14,15),y+20, fxLife * 1.8, false);
}

draw_self();
/*if (charged)
{
    draw_set_color(c_electricity);
    
    var obj;
    obj = instance_nth_nearest(x,y, object_index, choose(2,3));
    var sx = x + 16;
    var sy = y + 20;
    var tx = obj.x + 16;
    var ty = obj.y + 20;
    
    var x0, x1, y0, y1;
    x1 = sx;
    y1 = sy;
    for (var i = 0; i < 4; i += 1)
    {
        var pct1 = (i+1)/4;
        x0 = x1;
        y0 = y1;
        var x1 = lerp(sx, tx, pct1) + random_range(-7,7);
        var y1 = lerp(sy, ty, pct1) + random_range(-7,7);
        
        draw_line(x0, y0, x1, y1);
    }
}*/

/* */
/*  */
