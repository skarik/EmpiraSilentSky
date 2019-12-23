

timer += Time.dt;
if ( timer > 2.0 )
{
    delete(this);
}

if (true || controlUpdateAndCheckAny()) delete(this);

