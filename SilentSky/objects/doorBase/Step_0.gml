if ( open )
{
    parta.y = max( ystart - sprite_height/2 + 3, parta.y - Time.dt * 256 );
    partb.y = min( ystart + sprite_height/2 - 3, partb.y + Time.dt * 256 );
}
else
{
    parta.y = min( ystart, parta.y + Time.dt * 256 );
    partb.y = max( ystart, partb.y - Time.dt * 256 );
}

