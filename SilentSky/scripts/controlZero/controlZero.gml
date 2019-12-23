/// @function controlZero(clear_all)
/// @description Zero out inputs
/// @param clear_all {boolean} If true, re-inits entire state.
if (argument0 == false)
{
	xAxis.value = 0.0;
	yAxis.value = 0.0;
	
	zButton.value = 0.0;
	xButton.value = 0.0;
	aButton.value = 0.0;
	sButton.value = 0.0;
	
	lButton.value = 0.0;
	rButton.value = 0.0;
	tabButton.value = 0.0;
	escButton.value = 0.0;
}
else
{
	controlCleanup();
	controlInit();
}