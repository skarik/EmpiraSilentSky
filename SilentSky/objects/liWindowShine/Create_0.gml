//cast down and find floor
height = 0;
while (!position_meeting(x,y+height, bloxBase) && height < sprite_height)
{
    height += 8;
}
//height += 31;

