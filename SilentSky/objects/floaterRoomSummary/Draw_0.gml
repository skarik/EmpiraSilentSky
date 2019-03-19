var pulse = sin(current_time * 0.0077)+1;

draw_set_color(c_maroon);
draw_set_alpha(min(1.0,image_alpha) * (0.5 + pulse*0.1));
draw_rectangle(x-29,y-24,x+29,y+13, false);

draw_set_color(c_red);
draw_set_alpha(min(1.0,image_alpha));

draw_set_valign(fa_middle);
draw_set_font(fntTicker);

draw_set_halign(fa_center);
draw_text(x,y-15,string_hash_to_newline("PREVIOUS#SCAN RESULTS"));
draw_set_halign(fa_left);
draw_text(x-24,y+2,string_hash_to_newline("Items"));
draw_text(x-24,y+10,string_hash_to_newline("Hazards"));
draw_set_halign(fa_right);
draw_text(x+24,y+2,string_hash_to_newline(string(instance_number(pickupBase))));
draw_text(x+24,y+10,string_hash_to_newline(string(instance_number(enemyBase) - 1)));

draw_set_alpha(1.0);


