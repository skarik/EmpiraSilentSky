event_inherited();

chHealth = min( chMaxHealth, chHealth + chRegen * Time.dt );
if ( chHealth < 0 )
{
    delete(this);
    event_user(0);
}

