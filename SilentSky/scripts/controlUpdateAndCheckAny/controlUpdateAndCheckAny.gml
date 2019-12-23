
controlUpdate(true);

if (zButton.pressed || xButton.pressed || aButton.pressed || sButton.pressed
	|| lButton.pressed || rButton.pressed
	|| tabButton.pressed || escButton.pressed)
{
    return true;
}

return false;
