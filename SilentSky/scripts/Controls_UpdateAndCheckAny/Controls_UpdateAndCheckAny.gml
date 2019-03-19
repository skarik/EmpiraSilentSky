
Controls_Update(true);

if ((zButton > 0.8 && zButtonPrev < 0.8) || (xButton > 0.8 && xButtonPrev < 0.8) ||
    (aButton > 0.8 && aButtonPrev < 0.8) || (sButton > 0.8 && sButtonPrev < 0.8) ||
    (lButton > 0.8 && lButtonPrev < 0.8) || (rButton > 0.8 && rButtonPrev < 0.8) ||
    (tabButton > 0.8 && tabButtonPrev < 0.8) || (escButton > 0.8 && escButtonPrev < 0.8))
{
    return true;
}

return false;
