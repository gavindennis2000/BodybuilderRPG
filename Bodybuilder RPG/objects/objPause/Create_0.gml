if (TEST) { if (live_call()) return live_result; }  // gmlive

paused = false;
unpause = false;
fadeBlack = 0;

selection = "status";
screen = "status";

menuX = 500;
menuXInitial = menuX;
menuMargin = 10;

leftCounter = 0;
rightCounter = 0;

layer = layer_exists("pause") ? layer_get_id("pause") : layer_create(-999, "pause");

function getColor(select) {
    // finds the correct color for menu options
    
    var str = string(select)
    var color = c_white;
    if (str == selection)
        color = #cccc00;  // darkish yellow
    return color;
}