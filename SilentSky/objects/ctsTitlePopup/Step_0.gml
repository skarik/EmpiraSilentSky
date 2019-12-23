timer += Time.dt;
/*if ( timer > 2.0 )
{
    delete(this);
}*/

if (controlUpdateAndCheckAny()) fade = true;//delete(this);

if (fade)
{
	alpha -= Time.deltaTime;
	if (alpha <= 0.0) {
		delete(this);
	}
}

