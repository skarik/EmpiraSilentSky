Motion_Update();
View_Update();


if ( keyboard_check_pressed(ord("R")) )
{
    if ( moPlayer )
    {
        chHealth -= chMaxHealth * 0.1;
    }
}

// Revive players when no enemies are around
if ( moDead )
{
    var enemies = false;
    var source = id;
    with (enemyBase)
    {
        if ( Combat_CanHit(source, id) )
        {
            enemies = true;
        }
    }
    
    if ( enemies == false )
    {
        moDead = false;
        chHealth = 1;
    }
}

if ( moDead )
{
	if (exists(floaterDead))
	{
		if (floaterDead.image_alpha > 4.0)
		{
			gameLoad();
		}
	}
}
