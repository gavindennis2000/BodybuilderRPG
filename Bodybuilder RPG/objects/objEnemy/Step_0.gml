/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// load stats
var canLoad = (
	variable_global_exists("benStats") && 
	variable_global_exists("deadlynnStats") && 
	variable_global_exists("quadeStats")
)

if (!statsLoaded and canLoad) {
	statsLoaded = true;
	switch(fighter) {
		case "npc":
		default:
			loadStatsEnemy(fighter);
	}
}