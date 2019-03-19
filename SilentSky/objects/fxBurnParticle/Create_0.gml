image_alpha = random_range(-0.1,0.0);
xspeed = random_range(-20,20);
yspeed = random_range(-110, -120);
ygrav = 10;
depth = choose(-2,2,2) + objPlayerMain.depth;

image_angle = choose(0,90,180,270);
image_speed = 0;
image_index = choose(0,1);

fxSpeedOffset = random_range(0.9,1.1) * random_range(0.9,1.1) * random_range(0.9,1.1);
fxFadeState = 0;
image_alpha = 0;

