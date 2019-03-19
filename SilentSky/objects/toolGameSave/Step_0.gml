if (place_meeting(x,y,objPlayerMain))
{
    if (!game_saved)
    {
        sound_play_at(x + 16, y + 48, sndSavegame);
    
        Game_Save();
        game_saved = true;
    }
}

