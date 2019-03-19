if ( timer < 0.2 )
{
    draw_set_color(c_electricity);
    draw_circle(x,y,30 + timer * 30, (timer < 0.15));
}
else if ( timer < 0.4 )
{
    draw_set_color(c_white);
    draw_circle(x,y,80,false);
}
if ( timer < 0.6 )
{
    draw_set_color(c_electricity);
    draw_circle(x,y,40,false);
}
else if ( timer < 0.8 )
{
    draw_set_color(c_white);
    draw_circle(x,y,60,false);
}
else
{
    draw_set_color(c_electricity);
    draw_circle(x,y,70 + 70 * timer,true);
}

