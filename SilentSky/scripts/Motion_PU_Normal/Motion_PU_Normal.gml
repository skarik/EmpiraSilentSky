// Player controls start:
var hasControl = moPlayer;
if (moPlayer && exists(ctsTalker))
{
    if (ctsTalker.input_priority)
    {
        controlInit();
        hasControl = false;
    }
}
if (!moInput || moDead)
{
    controlInit();
    hasControl = false;
}
if (moPlayer) controlUpdate(hasControl);

// Update stun (prevent input)
if (isStunned)
{   // Slow down over time
    if (isOnGround)
    {
        var deltaValue = Time.dt * moDeAccelGround * clamp(1.0 - stunTimer, 0.0,1.0) * 0.25;
        if ( abs(xspeed) > deltaValue )
        {
            xspeed -= sign(xspeed) * deltaValue * (1.0 - 0.9*isOnGoo);
        }
        else
        {   // Below delta threshold, stop motion
            xspeed = 0;
        }
    }
    exit;
}

// Horizontal player input
if ( xAxis.value != 0 )
{
    // Get target xspeed (analogue control)
    var targetXspeed = moSpeedRun * abs(xAxis.value);
    // Change target speed based on status effects
    if ( !inventory.cloak ) targetXspeed *= 0.5;
    if ( isOnGlue ) targetXspeed *= 0.3 + (0.2*moPlayer);
    if ( isGlued ) targetXspeed *= 0.0 + (1.0*moPlayer);
    if ( isOnGoo || isBurning || isGooed ) targetXspeed *= 0.6 + (0.4*moPlayer);
    // Accelerate up to target speed
    if ( true )
    {
        if ( isOnGround )
            xspeed += moAccelGround * Time.dt * sign(xAxis.value) * (1.0 - 0.9*isOnGoo);
        else
            xspeed += moAccelAir * Time.dt * sign(xAxis.value);
    }
    if ( abs(xspeed) > targetXspeed )
    {   // Limit at target speed (so when stunned in the air, won't have abrupt motion)
        xspeed = sign(xspeed) * targetXspeed;
    }
    // Update the facing direction
    if ( sign(xspeed) != 0 )
    {
        facingDir = sign(xspeed);
    }
}
else if ( isOnGround )
{
    // Deccelerate if on the ground
    var deltaValue = Time.dt * moDeAccelGround;
    if ( abs(xspeed) > deltaValue )
    {
        xspeed -= sign(xspeed) * deltaValue * (1.0 - 0.9*isOnGoo);
    }
    else
    {   // Below delta threshold, stop motion
        xspeed = 0;
    }
}
// Jumping player input
if ( !isGlued && inventory.cloak && isOnGround && jumpButton.pressed )
{
    if ( jumpTimer <= 0.0 )
    {
        jumpTimer = 1.0;
    }
}
// Melee and use attack input
else if ( !isGlued && inventory.sword )
{
	// Using buttons:
    var pressed = false;
	if ( useButton.pressed )
	{
	    var button = instance_nearest(x,y,buttonBase);
	    if ( moPlayer && place_meeting(x,y,button) )
	    {
	        // Do a range check around the player
	        var enemy = collision_circle(x,y,72,enemyBase,false,true);
	        if ( enemy == null || !damageCanHit(id,enemy) )
	        {   // No enemy? Push the button
				var current_user = id;
	            with (button)
				{
					user = current_user;
					event_user(1);
				}
	            pressed = true;
	        }
	    }
	}
    
	// Using melee:
	if ( atkButton.pressed )
	{
	    if ( !pressed )
	    {
			// Only attack if we have the stamina to attack with
	        if ( chStamina > moAtkStamina0 )
	        {   // If have stamina, attack
	            atkTimer = 0;
	            atkQueued = false;
	            if ( sign(yAxis.value) == 1 )
	                moState = MO_MELEEGND0;
	            else if ( sign(xAxis.value) == 0 )
	                moState = MO_MELEESTAND0;
	            else
	                moState = MO_MELEE0;
	            // Update facing direction if button pressed
	            if ( sign(xAxis.value) != 0 )
	            {
	                facingDir = sign(xAxis.value);
	            }
	        }
	        else
	        {   // Else, do nothing but instantly reset stamina timer
	            staminaTimer = 1.0;
	        }
	    }
	}
	
}
// Gun input
/*else if ( !isGlued && inventory.gun )
{
    Motion_PU_GunControl();
}*/
else if ( dodgeButton.pressed )
{
    if ( isOnGround && dashTimer > moDashCooldown )
    {
        // Do the dodge now
        moState = MO_DASH;
        // Reset dash timer
        dashTimer = 0.0;
    }
}
else if ( specialButton.pressed )
{
    // Do the special now
    if ( chMana > moSpecialMana )
    {   // If have mana, attack
        atkTimer = 0;
        atkQueued = false;
        moState = MO_SPECIAL;
        // Reset spell cast state
        spellTimer = 0;
        spellState = SPELL_INBOOK;
    }
}
else if (moPlayer && prevCharButton.pressed )
{
    var playerselection;
    playerselection[0] = objPlayerPaladin;
    playerselection[1] = objPlayerPrincess;
    playerselection[2] = objPlayerTinkerer;
    var playercurrent = 0;
    for ( var i = 0; i < 3; ++i )
    {
        if ( playerselection[i] == object_index )
        {
            playercurrent = i;
            break;
        }
    }
    for ( var i = 1; i < 4; ++i )
    {
        var index = (playercurrent + i) % 3;
        if ( exists(playerselection[index]) && playerselection[index].moPlayerAvailable )
        {
            with (objPlayerMain) 
            {   // Zero controls
                controlInit();
                // Stop swapping next frame
				repeat (2)
				{
					inputSet(prevCharButton, 1.0);
					inputSet(nextCharButton, 1.0);
				}
                // Disable player input
                moPlayer = false;
            }
            playerselection[index].moPlayer = true;
            audio_play_sound(sndUiBlip1, 40, false);
            
            break;
        }
    }
}
else if (moPlayer && nextCharButton.pressed )
{
    var playerselection;  // Reverse order
    playerselection[2] = objPlayerPaladin;
    playerselection[1] = objPlayerPrincess;
    playerselection[0] = objPlayerTinkerer;
    var playercurrent = 0;
    for ( var i = 0; i < 3; ++i )
    {
        if ( playerselection[i] == object_index )
        {
            playercurrent = i;
            break;
        }
    }
    for ( var i = 1; i < 4; ++i )
    {
        var index = (playercurrent + i) % 3;
        if ( exists(playerselection[index]) && playerselection[index].moPlayerAvailable )
        {
            with (objPlayerMain) 
            {   // Zero controls
                controlInit();
                repeat (2)
				{
					inputSet(prevCharButton, 1.0);
					inputSet(nextCharButton, 1.0);
				}
                // Disable player input
                moPlayer = false;
            }
            playerselection[index].moPlayer = true;
            audio_play_sound(sndUiBlip1, 40, false);
            
            break;
        }
    }
}

