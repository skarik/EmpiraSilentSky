// Create screen shake on hurt effects
if ( moPlayer && chHealth < chPrevHealth )
{
    var damage_gradient = (chPrevHealth - chHealth) * (100/chMaxHealth);
    Effect_ScreenShake(
        1 + floor(damage_gradient * 0.25),
        0.3 + floor(damage_gradient) * 0.05,
        true);
    Effect_ControllerShake(
        1.0,
        0.2 + floor(damage_gradient) * 0.03,
        true);
}

// Now update base code
event_inherited();

