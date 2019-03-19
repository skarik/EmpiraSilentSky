/// @description  Level_GeneratePickups(width,height,cel_width,cel_height)
/// @param width
/// @param height
/// @param cel_width
/// @param cel_height

var w = argument0;
var h = argument1;
var subroom_w = argument2;
var subroom_h = argument3;

// Loop through each room and kick ass
for (var cx = 0; cx < w; ++cx)
{
    for (var cy = 0; cy < h; ++cy)
    {
        var ofx = x + cx * subroom_w;
        var ofy = y + cy * subroom_h;
        
        var room_type = lvTypes[cx + cy*w];
        // Only place the sword in a hallway, so we can place a goo wall after
        if ( room_type & ROOM_HALLWAY && !(room_type & ROOM_CLIMB_UP) && !(room_type & ROOM_CLIMB_DOWN) && choose(0,0,1) )
        {
            place_unique( ofx + 32*6, ofy + 32*6, liBulbRed );
            place_unique( ofx + 32*2, ofy + 32*6, liBulbRed );
            break;
        }
    }
}
