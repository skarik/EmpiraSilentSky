if (fade == false)
{
    image_alpha += Time.dt * fade_speed;
    if (image_alpha >= 1.0)
    {
        fade = true;
    }
}
else
{
    image_alpha -= Time.dt * fade_speed;
    if (image_alpha <= 0.0)
    {
        x = xstart;
        fade_speed = random_range(0.25, 0.75);
        fade_xspeed = random_range(-16,16);
        fade = false;
    }
}
x += fade_xspeed * Time.dt;

