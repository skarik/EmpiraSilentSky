timer += Time.dt;
/*if ( timer > 2.0 )
{
    idelete(this);
}*/

if (controlUpdateAndCheckAny()) fade = true;//idelete(this);

if (fade)
{
	alpha -= Time.deltaTime;
	if (alpha <= 0.0) {
		idelete(this);
	}
}

