depth = -9;

global.roomVar = momB;
global.pX = x;
global.pY = y;

camX = 0;
camY = 0;

displayRoom = 0;
displaySub = 0;
roomAlpha = 0;
subAlpha = 0;
theRoom = -1;
subtitle = -1;
prevRoomVar = -1;
prevSubtitle = -1;

global.characters = ["Ben"];
global.gymbag = array_create(20, ["", ""]); global.gymbag[0] = ["Hydro20", 2]

global.benStats = {
	lvl: 1,
	xp: 0,
	maxhp: 100,
	hp: 100,
	sk: 10,
	att: 5,
	def: 5,
	spd: 5,
	luck: 5
}
global.quadeStats = {
	lvl: 1,
	xp: 0,
	maxhp: 200,
	hp: 200,
	sk: 0,
	att: 5,
	def: 5,
	spd: 5,
	luck: 5
}
global.deadlynnStats = {
	lvl: 1,
	xp: 0,
	maxhp: 300,
	hp: 300,
	sk: 20,
	att: 5,
	def: 5,
	spd: 5,
	luck: 5
}

// TEST load fight data
if (file_exists("battleInfo.txt")) {
	var _file = file_text_open_read("battleInfo.txt");
	var _json = file_text_read_string(_file);
	var _battleInfo = json_parse(_json);
		
	global.benStats = _battleInfo.ben;
	global.deadlynnStats = _battleInfo.deadlynn;
	global.quadeStats = _battleInfo.quade;	
		
	file_text_close(_file);
}
else saveGame();