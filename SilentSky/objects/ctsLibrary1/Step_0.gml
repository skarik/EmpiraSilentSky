if (!Cutscene_Update())
{
    if (Cutscene_GetWaitId() == "storyselect")
    {
        // todo: do story select
        /*Cutscene_WaitEnd();
        
        target_pitch = 0.75;*/
        if (!exists(ctsLibraryBookcase)) new(ctsLibraryBookcase);
        if (ctsLibraryBookcase.bk_selected)
        {
            Cutscene_WaitEnd();
            target_pitch = 0.75;
        }
    }
    if (Cutscene_GetChoiceReady())
    {
        target_pitch = 0.50;
    }
    if (Cutscene_GetWaitId() == "storybegin")
    {
        if (!exists(ctsFadeOutLongBlack))
        {
            new(ctsFadeOutLongBlack);
            audio_sound_gain(music, 0.0, 1000);
            target_pitch = 0.25;
        }
        else if (ctsFadeOutLongBlack.image_alpha >= 1.0)
        {
            audio_stop_all();
            room_goto(rm_librarian_2);
            exit;
        }
        //room_goto(rm_menu);
    }
}

// update pitch
var dp = target_pitch - pitch;
var dspeed = Time.dt * 0.5;
if ( abs(dp) > dspeed )
    pitch += sign(dp) * dspeed;
else
    pitch += dp;
audio_sound_pitch(music, pitch);


/* */
/*  */
