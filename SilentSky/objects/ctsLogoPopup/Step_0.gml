

timer += Time.dt;
if ( timer > 2.0 )
{
    delete(this);
}

if (true || Controls_UpdateAndCheckAny()) delete(this);

