/*gmlive*/if (TEST) { if (live_call()) return live_result; }
    
layer = layer_create(-1000, "battle");
camAngle = real(camera_get_view_angle(view_camera[0]));
i = 0;
fadeWhite = 0;
initialX = camera_get_view_x(view_camera[0]);
initialY = camera_get_view_y(view_camera[0]);

player = {
    spr: sprPlayerUp,
    x: 240 - 32,
    y: 135 - 32 + 30,
}

if (!variable_instance_exists(self, "enemy")) {
    enemy = {
        name: "DYEL",
        spr: sprPlayerDown,
        x: 240 - 32,
        y: 135 - 32 - 30,
    }
}
pStart = player.x;
ready = false;
menuX = 0;

selection = "attack";
screen = "menu";

inventory = global.inventory;
attacks = global.attacks;  // attacks are static
skills = [array_length(global.skills)];
array_copy(skills, 0, global.skills, 0, array_length(global.skills));



function getColor(select) {
    // finds the correct color for menu options
    // attacks, skills, and items
    if (is_struct(select)) {
        if (select.name == selection.name)
            return #cccc00;
    }
    var str = string(select)
    var color = c_white;
    if (str == selection)
        color = #cccc00;  // darkish yellow
    return color;
}