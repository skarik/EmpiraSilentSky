/// @description  Level_Generate(width,height)
/// @param width
/// @param height

var w = argument0;
var h = argument1;

// First start out with an empty map
for (var i = 0; i < w*h; ++i)
{
    lvTypes[i] = ROOM_UNSET;
}

// Generate the level generosity
lvGenerosity = choose(-1,0,1);
if (levelManager.lvAreaCount > 0)
{  
    if (random(1) < 0.1)
    {   // 10% chance for a more generous room
        lvGenerosity += choose(1,2,3);
    }
    if (random(1) < 0.2)
    {   // 20% for a fucking hard room
        lvGenerosity -= choose(2,3,4);
    }
}

// Generate the level types now
lvEntranceCel = 0;
lvExitCel = 0;
Level_GenerateTypes(w,h); // Set the entrance and exit cels as well

// Set subroom size
var subroom_w = 32*8;
var subroom_h = 32*8;
// Based on the height of the entrance, change the offset position
y -= lvEntranceCel * subroom_h;

// Make the rooms now
Level_BuildRoomCollision(w,h,subroom_w,subroom_h);
// Generate the pickups
Level_GeneratePickups(w,h,subroom_w,subroom_h);
// Generate obstacles
Level_GenerateObstacles(w,h,subroom_w,subroom_h);
// Generate the tiles for the look
Level_GenerateTiles(w,h,32,32,8,8);
// Generate extra junk now
Level_GenerateJunk(w,h,subroom_w,subroom_h);

// Now, based on the height of the exit, chance the offset position
y += lvExitCel * subroom_h;


