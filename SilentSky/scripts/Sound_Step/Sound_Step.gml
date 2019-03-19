switch (argument0)
{
case BLOOD_RED: return sndHitMeat;
case BLOOD_GOO:
case BLOOD_GLUE: return sndHitMeat;
case BLOOD_BLACK: return sndHitMeat;
case BLOOD_SPARKS: return sndStepStone;
case BLOOD_DUST: return choose(sndStepDirt1,sndStepDirt2);
case BLOOD_TIMBER: return sndStepStone;
}
return sndStepGravel;
