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
        bk_fade = -0.1;
    }
    if ( xAxis < -0.8 && xAxisPrev > -0.8 )
    {
        audio_play_sound(sndUiBlip2, 50, false);
        bk_selection -= 1;
        bk_fade = -0.1;
    }
    if (( xButton > 0.8 && xButtonPrev <= 0.8 ) || ( zButton > 0.8 && zButtonPrev <= 0.8 ))
    {
        if (bk_selection == 7)
        {
            audio_play_sound(sndUiSuccess1, 50, false);
			// Bring it all the way in
			bk_fade = 1.0;
            // Fade out!
            bk_selected = true;
            depth = 10;
        }
        else
        {
            audio_play_sound(sndUiMsgBlip, 50, false);
            bk_fade += 1.0;
			
			// Perform crumble
			if (!bk_crumbleOn[bk_selection])
			{
				bk_crumbleOn[bk_selection] = true;
				bk_crumbleX = bk_posx[bk_selection];
				bk_crumbleY = bk_posy[bk_selection];
				bk_crumbleAlpha = 3.0;
				switch (bk_crumbleStyle[bk_selection])
				{
				case 0:
					if (bk_crumbleCount == 0)
						bk_crumbleText = "The book crumbles away at your touch.";
					else if (bk_crumbleCount == 1)
						bk_crumbleText = "Another book crumbles away at your touch.";
					else if (bk_crumbleCount == 2)
						bk_crumbleText = "You should probably stop touching some of these.";
					else if (bk_crumbleCount == 3)
						bk_crumbleText = "And another one crumbles away.";
					else if (bk_crumbleCount == 4)
						bk_crumbleText = "You try really hard this time, but the book still turns to dust.";
					else if (bk_crumbleCount == 5)
						bk_crumbleText = "Why hasn't the Librarian scolded you yet?";
					else if (bk_crumbleCount == 6)
						bk_crumbleText = "Your dust-laden hands destroy another book.";
					else if (bk_crumbleCount == 7)
						bk_crumbleText = "That book didn't feel so good.";
					else
						bk_crumbleText = "Another book crumbles away at your touch.";
					bk_crumbleCount++;
					break;
				case 1:
					bk_crumbleText = "The book disappears in a flash of sickly green.";
					break;
				case 2:
					bk_crumbleText = "Try as you might, the book refuses to open.";
					bk_crumbleOn[bk_selection] = false;
					break;
				}
			}
        }
    }
    
    bk_fade += Time.dt * 0.75;
    
    // Do book selection
    if ( bk_selection < 0 )
        bk_selection = bk_title_count - 1;
    else if ( bk_selection >= bk_title_count )
        bk_selection = 0;
}

// perform crumbles
if (bk_crumbleAlpha > 0.0)
{
	bk_crumbleAlpha -= Time.deltaTime;
	for (var i = 0; i < bk_title_count; ++i)
	{
		if (bk_crumbleOn[i]) {
			bk_crumble[i] += Time.deltaTime * 3.0;
		}
	}
}
