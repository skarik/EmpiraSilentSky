
controlUpdate(true);

if (jumpButton.pressed || atkButton.pressed || useButton.pressed
	|| dodgeButton.pressed || specialButton.pressed
	|| prevCharButton.pressed || nextCharButton.pressed
	|| tabButton.pressed || escButton.pressed)
{
    return true;
}

return false;
