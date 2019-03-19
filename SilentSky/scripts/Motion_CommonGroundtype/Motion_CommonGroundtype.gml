var ground_type = BLOOD_SPARKS;
if ( isOnGoo )
    ground_type = BLOOD_GOO;
else if ( isOnGlue )
    ground_type = BLOOD_GLUE;
return ground_type;
