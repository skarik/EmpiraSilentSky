

// Update drips
for (var i = 0; i < drCount; ++i)
{
    // If the splatter can still drip...
    if ( drHeight[i] < drMaxHeight[i] )
    {   // Then slowly let it drip
        drHeight[i] = min( drMaxHeight[i]*1.01, drHeight[i] + Time.dt * drSpeed[i] );
    }
}

// Make sure the parent still exists before destroying self
if (!exists(drParent))
{
    delete(this);
}

