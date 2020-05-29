x = __view_get( e__VW.XView, 0 );
y = __view_get( e__VW.YView, 0 );

// Update controls
controlUpdate(1);

// Show/hide menu
if (killme)
{
    image_alpha -= Time.dt * 2.0;
    if ( image_alpha < 0.0 )
    {
        idelete(this);
    }
    
}
else
{
    image_alpha = min( image_alpha + Time.dt * 2.0, 1.0 );
    
    // Do menu hiding
    if ( specialButton.pressed )
    {
        killme = true;
        audio_play_sound(sndUiFail2,30,false);
    }
    // Do menu sleection change
    if ( abs(yAxis.value) > 0.8 && abs(yAxis.previous) <= 0.8 )
    {
        menu_selection += sign(yAxis.value);
        menu_selection = clamp(menu_selection,0,menu_size-1);
        audio_play_sound(sndUiBlip2,30,false);
    }
    // Do purchase (if possible)
    if ( atkButton.pressed || jumpButton.pressed )
    {
        var i = menu_selection;
        if (playerInventory.ammo_goo < menu_cost_goo[i] || playerInventory.ammo_glue < menu_cost_glue[i])
        {
            // Play failure sound
            audio_play_sound(sndUiFail1,30,false);
        }
        else
        {
            // Do the purchase :D
            playerInventory.ammo_goo -= menu_cost_goo[i];
            playerInventory.ammo_glue -= menu_cost_glue[i];
            
            // Do the upgrade now
            if ( i == 0 ) objPlayerMain.chHealth = objPlayerMain.chMaxHealth;
            if ( i == 2 ) objPlayerMain.chMaxHealth += 25;
            else if ( i == 1 ) objPlayerMain.chRegen += 0.25;
            else if ( i == 3 ) objPlayerMain.chMaxStamina += 10;
            else if ( i == 4 ) {
                objPlayerMain.moAtkDamage0 += 2;
                objPlayerMain.moAtkDamage1 += 1.5;
            }
            else if ( i == 5 ) objPlayerMain.moGunDamage += 1;
            
            // Play upgrade sound
            audio_play_sound(sndUiSuccess1,30,false);
        }
    }
    
}

