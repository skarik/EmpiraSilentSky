
// Heal ALL players
with (objPlayerMain)
{
    if (moPlayerAvailable)
    {
        chHealth = min(chHealth + 50, chMaxHealth);
    }
}

// Play the heal sound effect
sound_play_at(x,y,sndPaladinCast);
