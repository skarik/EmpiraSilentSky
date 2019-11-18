/// @description singleton_this() Returns true if the calling script should abort
if (instance_number(object_index) > 1)
{
    persistent = false;
    delete(this);
    return true;
}
return false;
