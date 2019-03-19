prevtime = time;
time += Time.dt;

if ( prevtime < 1.0 && time >= 1.0 )
{
    // Remove the title after some time
    if (exists(floaterLogo))
    {
        floaterLogo.fadeout = true;
    }
}

if ( !exists(pickupCoat) )
{
    delete(this);
}

