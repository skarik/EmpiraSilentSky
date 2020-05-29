if (!cutsceneUpdate())
{
    if (cutsceneGetWaitId() == "storyselect")
    {
        // todo: do story select
        /*cutsceneWaitEnd();
        
        target_pitch = 0.75;*/
        if (!iexists(ctsLibraryBookcase)) inew(ctsLibraryBookcase);
        if (ctsLibraryBookcase.bk_selected)
        {
            cutsceneWaitEnd();
            target_pitch = 0.75;
        }
    }
    if (cutsceneIsChoiceReady())
    {
        target_pitch = 0.50;
    }
    if (cutsceneGetWaitId() == "storybegin")
    {
        if (!iexists(ctsFadeOutLongBlack))
        {
            inew(ctsFadeOutLongBlack);
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
