/// @description  Combat_Falldamage(target,damage)
/// @param target
/// @param damage

var target = argument0;
var damage = argument1;

with (target)
{
    chHealth -= damage;
        
    // Create damage ticker
    //var ticker = instance_create(x,y, floaterDmgTicker);
    //    ticker.value = damage;
    
    // Play hit-ground sound
    sound_play_at(x,y,sndStepGravel);
    
    // Do blood effect
    if ( chBloodtype == BLOOD_RED )
    {
        instance_create(x+random_range(-10,10),y-10,gameBlooddrop);
    }
}
