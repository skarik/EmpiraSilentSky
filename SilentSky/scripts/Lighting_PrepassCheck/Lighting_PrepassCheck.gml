

with ( enemyBase )
{
    // Make sword flash
    if ( sprite_index == sprPlayerMelee1 )
    {
        if ( image_index > 3 && image_index <= 4 )
        {
            Lighting_ForceUpdate();
        }
    }
}

// Calculate theoretical next draw position.
var areaSize = cel_size * cel_count;
var possible_renderX = round((__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) * 0.5 - areaSize * 0.5) / cel_size) * cel_size;
var possible_renderY = round((__view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) * 0.5 - areaSize * 0.5) / cel_size) * cel_size;
if ( possible_renderX != cel_renderX || possible_renderY != cel_renderY )
{
    Lighting_ForceUpdate();
}

