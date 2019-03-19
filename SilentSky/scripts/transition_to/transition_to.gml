// Then we go to the next room:
with (objPlayerMain)
{
    if (!moPlayerAvailable) continue;
    
    persistent = true;
    inventory.persistent = true;
}
with (playerHud)
{
    persistent = true;
}
room_goto(argument0);
