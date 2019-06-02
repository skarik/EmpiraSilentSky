if (Debug.reset && !exists(Game))
    return false;

if (global._flag_cutscene[argument0] == true)
{
    cutsceneInit();
    delete(this);
    return true;
}
global._flag_cutscene[argument0] = true;
return false;

