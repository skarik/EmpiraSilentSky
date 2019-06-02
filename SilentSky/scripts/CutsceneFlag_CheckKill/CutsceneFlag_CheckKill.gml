if (Debug.reset && !exists(Game))
    return false;

if (global._flag_cutscene[argument0] == true)
{
    cutsceneInit();
    delete(this);
    return true;
}
this._sys_target_flag = argument0;
return false;

