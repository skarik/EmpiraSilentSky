timer += Time.dt;
/*if ( timer > 2.0 )
{
    delete(this);
}*/

if (Controls_UpdateAndCheckAny()) delete(this);

