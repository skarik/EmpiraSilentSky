
draw_set_color(c_white);
draw_set_alpha(0.5);
for (var i = 0; i < links; ++i)
{
    if (iexists(link[i]))
    {
        draw_line(x,y, link[i].x,link[i].y);
    }
}
draw_set_alpha(1.0);
draw_circle(x,y, 2, false);

