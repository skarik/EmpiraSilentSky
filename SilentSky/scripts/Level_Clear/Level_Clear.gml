var clearpos = argument0;

with ( bloxBase )
{
    if ( x < clearpos - 16 )
        instance_destroy();
}
with ( doorBase )
{
    if ( x < clearpos - 64 )
        instance_destroy();
}
with ( enemyBase )
{
    if ( x < clearpos - 16 )
        instance_destroy();
}

with ( splatterBase )
{
    if ( x < clearpos - 16 )
        instance_destroy();
}
with ( projectileSplat )
{
    if ( x < clearpos )
        instance_destroy();
}
with ( pickupBase )
{
    if ( x < clearpos - 16 )
        instance_destroy();
}

with ( junkDoodad )
{
    if ( x < clearpos - 16 )
        instance_destroy();
}

// Clear off tiles as well


