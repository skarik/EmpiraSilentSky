switch (argument0)
{
case BLOOD_RED: return sndFleshHit1;//choose(sndHit1,sndHit2);
case BLOOD_GOO:
case BLOOD_GLUE: return sndHitMeat;
case BLOOD_BLACK: return sndHitMeat;
case BLOOD_SPARKS: return sndHitMetal;
case BLOOD_DUST: return sndHitStone;
case BLOOD_TIMBER: return sndHitWood;
}
return sndHitWood;

