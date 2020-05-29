var enemy = collision_circle(x,y,4, enemyBase,false,true);
if (enemy != null && enemy.object_index != objPlayerMain)
{
    enemy.isGlued = true;
    enemy.guTimer = 0; // Refresh the burn timer
    
    // Create hit sound
    var sound_hit = sound_play_at(x,y, Sound_Step(BLOOD_GOO));
    
    idelete(this);
}

