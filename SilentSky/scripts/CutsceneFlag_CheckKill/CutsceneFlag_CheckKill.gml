if (Debug.reset && !iexists(Game))
    return false;

if (global._flag_cutscene[argument0] == true)
{
    cutsceneInit();
    idelete(this);
    return true;
}
this._sys_target_flag = argument0;
return false;

