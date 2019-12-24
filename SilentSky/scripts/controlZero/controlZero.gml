/// @function controlZero(clear_all)
/// @description Zero out inputs
/// @param clear_all {boolean} If true, re-inits entire state.
if (argument0 == false)
{
	xAxis.value = 0.0;
	yAxis.value = 0.0;
	
	jumpButton.value = 0.0;
	atkButton.value = 0.0;
	useButton.value = 0.0;
	dodgeButton.value = 0.0;
	specialButton.value = 0.0;
	
	prevCharButton.value = 0.0;
	nextCharButton.value = 0.0;
	tabButton.value = 0.0;
	escButton.value = 0.0;
}
else
{
	controlCleanup();
	controlInit();
}