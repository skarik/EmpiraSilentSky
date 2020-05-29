prevtime = time;
time += Time.dt;

if ( prevtime < 1.0 && time >= 1.0 )
{
    // Remove the title after some time
    if (iexists(floaterLogo))
    {
        floaterLogo.fadeout = true;
    }
}

if ( !iexists(pickupCoat) )
{
    idelete(this);
}

