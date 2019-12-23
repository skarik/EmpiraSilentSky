// SpellCast update
/*
-Magic Controls:
    -if multiple spells, press once to show book
    -press once to cast
    -the character begins charging the spell in place.
        -controls are disabled
        -melee and dash cancels
    -once the spell is fully charged, any button releases it
*/

/*
thus, npcs have the variables:
    spellState
    spellCastTimer
and
    spellCastSpeed: set by the current spell, can change

and the check
    if ( spelCastTimer >= 1.0 )
dictates ready state

in that, there's only two states for spellState

atkTimer and the default movetype is then 

for configuration:
mgCount
mgCastTime[]
mgCastCb[]
mgCastCost[]

*/
// Player controls start:
if (moPlayer) controlUpdate(moPlayer);

if (spellState == SPELL_INBOOK)
{
    Motion_SC_UpdateBook();
}
else if (spellState == SPELL_CASTING)
{
    Motion_SC_UpdateCast();
}
else if (spellState == SPELL_FOLLOWTHRU)
{
    Motion_UpdateSpecial();
}

