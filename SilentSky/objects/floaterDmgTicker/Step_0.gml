y -= 16 * image_alpha * Time.dt;

image_alpha -= Time.dt * 2.0;
if ( image_alpha < 0 )
    delete(this);

