
if (dispelled)
{
    dispel_time = max(0, dispel_time + Time.dt);
    if (dispel_time > 1.0) idelete(this);
}
else
    dispel_time = -1.0;
if (faded)
{
    fade_time = max(0, fade_time + Time.dt);
    if (fade_time > 1.0) idelete(this);
}
else
    fade_time = -1.0;

    
if (dispelled || faded)
    return false;
return true;
