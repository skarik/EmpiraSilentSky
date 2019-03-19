if (fade_in)
{
    fade_timer = min(fade_timer + Time.dt, 1.0);
}
else
{
    fade_timer -= Time.dt;
    if (fade_timer <= 0.0) delete(this);
}

