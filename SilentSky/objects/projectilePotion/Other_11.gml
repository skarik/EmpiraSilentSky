var enemy = collision_circle(x,y,4, enemyBase,false,true);
if (enemy != null && Combat_CanHit(id,enemy))
{
    //enemy.isGlued = true;
    //enemy.guTimer = 0; // Refresh the burn timer
    
    // Create hit sound
    var sound_hit = sound_play_at(x,y, Sound_Step(BLOOD_GOO));
    
    // Explode into effect
    event_user(2); 
    delete(this);
    killme = true;
}
