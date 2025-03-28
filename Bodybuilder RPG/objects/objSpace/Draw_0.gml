/*set up gmlive for this function*/ if (TEST) { if (live_call()) return live_result; }

// draw the space background
var camX = camera_get_view_x(cam)
while (spaceXStart != camX) {
    spaceX += camX - spaceXStart;
    spaceX2 += camX - spaceXStart;
    spaceXStart = camX;
}
var camY = camera_get_view_y(cam)
while (spaceYStart != camY) {
    spaceY += camY - spaceYStart;
    spaceY2 += camY - spaceYStart;
    spaceYStart = camY;
}

spaceX += 0.25;
spaceY += 0.1;
spaceX2 -= 0.05;
spaceY2 += 0.05;
var scale = 0.5, xDist = 48, yDist = 54;
// first row of stars
for (var i = 0; i < 480; i += xDist * 2) {
    for (var j = 0; j < 270; j += yDist) {
        finalX = spaceX + i;
        finalY = spaceY + j;
        while (finalX >= camX + 480) {
            finalX -= 480;
        }
        while (finalY >= camY + 270) {
            finalY -= 270;
        }
        draw_rectangle_color(finalX, finalY, finalX + scale, finalY + scale, c_white, c_white, c_white, c_white, false);
    }
}
// second row
var scale = 0.1, xDist = 48, yDist = 54;
for (var i = 0; i < 480; i += xDist) {
    for (var j = 0; j < 270; j += yDist) {
        finalX = spaceX2 + i + 24;
        finalY = spaceY2 + j + 27;
        while (finalX < camX) {
            finalX += 480;
        }
        while (finalY >= camY + 270) {
            finalY -= 270;
        }
        draw_rectangle_color(finalX, finalY, finalX + scale, finalY + scale, c_white, c_white, c_white, c_white, false);
    }
}