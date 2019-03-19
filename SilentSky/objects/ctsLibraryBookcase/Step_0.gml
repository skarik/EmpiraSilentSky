bk_move += Time.dt * 0.25 * (1.5 - bk_move);
bk_move = min(bk_move, 1.0);

y = __view_get( e__VW.HView, 0 ) + 32 - (bouncestep(smoothstep_u(bk_move)) * (96 + 16 * 256));

// Update controls
if (!bk_selected && bk_move >= 1.0)
{
    Controls_Update(true);
    if ( xAxis > 0.8 && xAxisPrev < 0.8 )
    {
        audio_play_sound(sndUiBlip2, 50, false);
        bk_selection += 1;
        bk_fade = -0.5;
    }
    if ( xAxis < -0.8 && xAxisPrev > -0.8 )
    {
        audio_play_sound(sndUiBlip2, 50, false);
        bk_selection -= 1;
        bk_fade = -0.5;
    }
    if (( xButton > 0.8 && xButtonPrev <= 0.8 ) || ( zButton > 0.8 && zButtonPrev <= 0.8 ))
    {
        if (bk_selection == 7)
        {
            audio_play_sound(sndUiSuccess1, 50, false);
            // Fade out!
            bk_selected = true;
            depth = 10;
        }
        else
        {
            audio_play_sound(sndUiMsgBlip, 50, false);
            bk_fade += 1.0;
        }
    }
    
    bk_fade += Time.dt * 0.5;
    
    // Do book selection
    if ( bk_selection < 0 )
        bk_selection = bk_title_count - 1;
    else if ( bk_selection >= bk_title_count )
        bk_selection = 0;
}

