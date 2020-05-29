if (Debug.reset && !iexists(Game))
    return false;

if (global._flag_cutscene[argument0] == true)
{
    cutsceneInit();
    return true;
}
global._flag_cutscene[argument0] = true;
return false;
