// Update gun timer
gunTimer += Time.dt;

if ( specialButton.pressed )
{
    // Show gun
    if (exists(gun)) gun.isHeld = true;
        
    if ( plCurrentGun != GUN_NONE )
    {
        plCurrentGun = (plCurrentGun % 3) + 1;
        
        // Limit selection to current inventory
        if ( plCurrentGun == GUN_GOO && !inventory.canister_goo )
            plCurrentGun = GUN_GLUE;
        if ( plCurrentGun == GUN_GLUE && !inventory.canister_glue )
            plCurrentGun = GUN_AIR;
        
        // Play swap sound
        var gun_sound = sound_play_at( x,y, sndWeaponClick );
            gun_sound.pitch = random_range(0.9,1.1);
            gun_sound.gain = random_range(0.7,0.8);
    }
}
// Gun fire input
else if ( dodgeButton.pressed )
{
    // Show gun
    if (exists(gun)) gun.isHeld = true;

    var shoot_direction = 90 - (90 + 45*yAxis.value)*facingDir + random_range(-2,2);
    if ( plCurrentGun == GUN_AIR )
    {
        if ( gunTimer > moGunTime )
        {
            gunTimer = 0.0; // Enable cooldown
        
            // Air shot
            Combat_Raycast( this,
                x,y-40,
                shoot_direction, 100,
                moGunDamage, // 6 Damage per shot
                DAMAGE_FIRE );
            
            // Play sound effect
            var gun_sound = sound_play_at( x,y, sndWeaponPistol );
                gun_sound.pitch = random_range(1.5,1.6);
                gun_sound.gain = random_range(0.7,0.9);
            // Shake screen
            Effect_ScreenShake( 3, 0.1, true );
            Effect_ControllerShake( 1.0, 0.2, false );
        }
    }
    else if ( plCurrentGun == GUN_GLUE )
    {
        if ( inventory.ammo_glue > 0 || choose(0,1,1) )
        {
            inventory.ammo_glue -= choose(1,2,3);
            inventory.ammo_glue = max(0,inventory.ammo_glue);
            
            var projectile = instance_create( x,y-40, projectileGlue );
                projectile.xspeed = lengthdir_x( 400, shoot_direction );
                projectile.yspeed = lengthdir_y( 400, shoot_direction );
                
            var gun_sound = sound_play_at( x,y, sndWeaponPistol );
                gun_sound.pitch = random_range(3.3,3.32);
                gun_sound.gain = random_range(0.7,0.9);
                
            Effect_ControllerShake( 1.0, 0.1, true );
        }
        else
        {
            // Play click sound for no ammo
            var gun_sound = sound_play_at( x,y, sndWeaponClick );
                gun_sound.pitch = random_range(1.9,2.0);
                gun_sound.gain = random_range(0.7,0.8);
                
            Effect_ControllerShake( 1.0, 0.03, false );
        }
    }
    else if ( plCurrentGun == GUN_GOO )
    {
        if ( inventory.ammo_goo > 0 )
        {
            inventory.ammo_goo -= choose(3,4,5);
            inventory.ammo_goo = max(0,inventory.ammo_goo);
            
            var projectile = instance_create( x,y-40, projectileGoo );
                projectile.xspeed = lengthdir_x( 400, shoot_direction );
                projectile.yspeed = lengthdir_y( 400, shoot_direction );
                
            var gun_sound = sound_play_at( x,y, sndWeaponPistol );
                gun_sound.pitch = random_range(3.3,3.32);
                gun_sound.gain = random_range(0.7,0.9);
                
            Effect_ControllerShake( 1.0, 0.1, true );
        }
        else
        {
            // Play click sound for no ammo
            var gun_sound = sound_play_at( x,y, sndWeaponClick );
                gun_sound.pitch = random_range(1.9,2.0);
                gun_sound.gain = random_range(0.7,0.8);
                
            Effect_ControllerShake( 1.0, 0.03, false );
        }
    }
}

