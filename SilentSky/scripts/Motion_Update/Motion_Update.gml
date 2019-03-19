

switch (moState)
{
case MO_NORMAL:
    Motion_UpdateNormal();
    break;
 
       
case MO_LEDGECLIMB:
    Motion_UpdateLedge();
    break;
case MO_LEDGESTICK:
    Motion_UpdateLedgeStick();
    break;
case MO_WALLSTICK:
    Motion_UpdateWallStick();
    break;
    
    
case MO_MELEE0:
    if ( moAtkStateOverride0 == null )
        Motion_UpdateMelee0();
    else
        script_execute(moAtkStateOverride0);
    break;
case MO_MELEE1:
case MO_MELEE2:
    if ( moAtkStateOverride1 == null )
        Motion_UpdateMelee1();
    else
        script_execute(moAtkStateOverride1);
    break;   
case MO_MELEEGND0:
case MO_MELEEGND1:
    if ( moAtkStateOverride0 == null )
        Motion_UpdateMeleeGnd0();
    else
        script_execute(moAtkStateOverride0);
    break;
case MO_MELEESTAND0:
case MO_MELEESTAND1:
    if ( moAtkStateOverride0 == null )
        Motion_UpdateMeleeStand0();
    else
        script_execute(moAtkStateOverride0);
    break;
    
        
case MO_DASH:
    Motion_UpdateDash();
    break;
case MO_SPECIAL:
    if ( moSpecialStateOverride == null )
        Motion_UpdateSpecial();
    else
        script_execute(moSpecialStateOverride);
    break;
}

// Perform velocity-based motion
x += xspeed * Time.dt;
y += yspeed * Time.dt;

// Update the sprite
Sprite_Update();

