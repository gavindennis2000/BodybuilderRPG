// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function saveGame(){
	
	var _playerInfo = {
		pX: global.pX,
		pY: global.pY,
		roomVar: room
	}
	
	var _battleInfo = {
		ben: global.benStats,
		deadlynn: global.deadlynnStats,
		quade: global.quadeStats
	}
	
	var _pString = json_stringify(_playerInfo);
	var _bString = json_stringify(_battleInfo);
	
	var _file1 = file_text_open_write("playerInfo.txt");
	file_text_write_string(_file1, _pString);
	
	var _file2 = file_text_open_write("battleInfo.txt");
	file_text_write_string(_file2, _bString);
	
	file_text_close(_file1); file_text_close(_file2);
	
}

function loadGame() {
	
	if (file_exists("playerInfo.txt")) {
		
		var _file = file_text_open_read("playerInfo.txt");
		var _json = file_text_read_string(_file);
		var _playerInfo = json_parse(_json);
		
		global.pX = _playerInfo.pX;
		global.pY = _playerInfo.pY;
		global.roomVar = _playerInfo.roomVar;
		
		file_text_close(_file);
		
	}
	if (file_exists("battleInfo.txt")) {
		
		var _file = file_text_open_read("battleInfo.txt");
		var _json = file_text_read_string(_file);
		var _battleInfo = json_parse(_json);
		
		global.benStats = _battleInfo.ben;
		global.deadlynnStats = _battleInfo.deadlynn;
		global.quadeStats = _battleInfo.quade;	
		
		file_text_close(_file);
		
	}
}