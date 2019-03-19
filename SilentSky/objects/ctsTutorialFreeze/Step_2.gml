depth = -100;

if (!fade)
{
    // Stop time
    Time.scale = max(0, Time.scale - Time.unscaled_dt * 4.0);
}
else
{
    // Restart time
    Time.scale = min(1.0, Time.scale + Time.unscaled_dt * 4.0);
    if (Time.scale >= 1.0)
    {
        delete(this);
    }
}

