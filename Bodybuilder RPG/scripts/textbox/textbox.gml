// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function textbox(text, action = -1){
	instance_create_layer(0, 0, "Instances", objTextbox, {
		text: text, 
		action, action
	});
}