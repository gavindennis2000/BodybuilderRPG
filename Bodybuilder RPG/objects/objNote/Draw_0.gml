// draw the notes on the guitar minigames

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (!isDestroyed) {
    // note after-images
    draw_sprite_ext(sprite_index, image_index, x, y - 21, 0.85, 0.85, image_angle, image_blend, image_alpha/8);
    draw_sprite_ext(sprite_index, image_index, x, y - 14, 0.9, 0.9, image_angle, image_blend, image_alpha/6);
    draw_sprite_ext(sprite_index, image_index, x, y - 7, 0.95, 0.95, image_angle, image_blend, image_alpha/4);

    // the actual noteccccvbn
    draw_self();
}
else {
    // flash big and then destroy
    if (image_xscale >= 1.5) { instance_destroy(); }
    spd = 0;
    image_xscale *= 1.09;
    image_yscale *= 1.09;
    image_alpha = 0.1;
    var oldFog = gpu_get_fog();
    gpu_set_fog(true, c_white, 0, 0);
    // draw_sprite_ext(sprite_index, image_index, x, y - 21, 0.85, 0.85, image_angle, image_blend, image_alpha/8);
    // draw_sprite_ext(sprite_index, image_index, x, y - 14, 0.9, 0.9, image_angle, image_blend, image_alpha/6);
    // draw_sprite_ext(sprite_index, image_index, x, y - 7, 0.95, 0.95, image_angle, image_blend, image_alpha/4);
    draw_self();
    gpu_set_fog(oldFog[0], oldFog[1], oldFog[2], oldFog[3]);
}