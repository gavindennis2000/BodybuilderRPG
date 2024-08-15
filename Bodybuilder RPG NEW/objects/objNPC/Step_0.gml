/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (face != "down" and !instance_exists(objTextbox) and alarm_get(0) <= 0) { alarm[0] = 120; }