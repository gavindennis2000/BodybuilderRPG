/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var spr = sprite_index;
var imgInd = image_index;

instance_create_layer(x, y, "Instances", objNPCDeath, {
    sprite_index: spr, 
    image_index: imgInd
});