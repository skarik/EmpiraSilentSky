/// @description damageCanHit(source,target)
/// @param source
/// @param target
var source = argument0;
var target = argument1;

// Not self?
if ( source.id != target.id )
{
    // No teams in common?
    if ((target.moTeam & source.moTeam) == 0)
    {
        return true;
    }
}
return false;

