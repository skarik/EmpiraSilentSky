
switch (argument0)
{
case TILESET_RUINS:
    return choose("MODERN RUINS","OLD CITY");
case TILESET_DESERT:
    return choose("DJEHUT WASTELAND","DJEHUT DESERT");
}
return "AREA " + string(levelManager.lvAreaCount);
