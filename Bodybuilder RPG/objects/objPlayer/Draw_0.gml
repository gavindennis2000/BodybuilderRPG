/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// don't draw in the battle room
if (room == rBattle) { exit; }
global.outfit.color = 1;
global.outfit.hair = 4;
global.outfit.hairColor = 0;

var hair = sprHairDown;

// player's direction
switch (face) {
	case "left":
		sprite_index = sprPlayerLeft;
		hair = sprHairLeft;
		break;
	case "right":
		sprite_index = sprPlayerRight;
		hair = sprHairRight;
		break;
	case "up":
		sprite_index = sprPlayerUp;
		hair = sprHairUp;
		break;
	case "down":
		sprite_index = sprPlayerDown;
		hair = sprHairDown;
		break;
}

// player's hair color
var hairColor = c_white;
switch (global.outfit.hairColor) {
	case 0:
		hairColor = #663500;
		break;
	case 1:
		hairColor = #ffff99;
		break;
	case 2:
		hairColor = #1a0d00;
		break;
	case 3:
		hairColor = #cc2900;
		break;
	case 4:
		hairColor = #66ccff;
		break;
}

// running animation speed
image_speed = running ? 0.4 : 0.2;
if (state == "stand") {image_index = 0; }

// draw the player a little higher than the ground
draw_sprite_part_ext(sprite_index, image_index, global.outfit.color*32, 0, 32, 32, x, y - 4, image_xscale, image_yscale, image_blend, image_alpha);
// draw the player's hair
draw_sprite_part_ext(hair, image_index, global.outfit.hair*32, 0, 32, 32, x, y - 8, image_xscale, image_yscale, hairColor, image_alpha);

// fade during room changes
if (fadeAlpha > 0) {
	var alpha = draw_get_alpha();
	draw_set_alpha(fadeAlpha);
	var camX = camera_get_view_x(view_camera[0]);
	var camY = camera_get_view_y(view_camera[0]);
	var b = c_black;
	draw_rectangle_color(camX, camY, camX+480, camY + 270, b, b, b, b, false);
	draw_set_alpha(alpha);
}