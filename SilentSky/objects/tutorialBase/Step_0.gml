if (!active)
{
    if ( point_distance(x,y,objPlayerMain.x,objPlayerMain.y) < 250 )
    {   // Activate when player is close enough
        active = true;
    }
}
else
{
    if ( !killme )
    {   // Fade in if active
        image_alpha = min( 1.0, image_alpha + Time.dt*2.0 );
        // And hold over player's head
        x = objPlayerMain.x;
        y = objPlayerMain.y - 102;
    }
    else
    {
        // Fade out and destroy if requested
        image_alpha -= Time.dt*2.0;
        if ( image_alpha < 0.0 )
        {
            delete(this);
        }
    }
}

