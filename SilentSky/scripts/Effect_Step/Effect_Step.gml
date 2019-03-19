// Returns impact effect object given a blood type
switch (argument0)
{
case BLOOD_RED: return fxDust0;
case BLOOD_GOO: return fxGooEmitterSm;
case BLOOD_GLUE: return fxGlueEmitterSm;
case BLOOD_BLACK: 
case BLOOD_SPARKS: 
case BLOOD_DUST:
case BLOOD_TIMBER: return fxDust0;
}
return fxDust0;
