if (Debug.reset && !exists(Game))
    return false;

if (global._flag_cutscene[argument0] == true)
{
    Cutscene_Init();
    return true;
}
global._flag_cutscene[argument0] = true;
return false;
