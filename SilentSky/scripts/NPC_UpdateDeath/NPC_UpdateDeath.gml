for (var i = 0; i < global._deathlist_size; ++i)
{
    if ( id == global._deathlist[i] )
    {
        exit;
    }
}
global._deathlist[global._deathlist_size] = id;
global._deathlist_size += 1;
