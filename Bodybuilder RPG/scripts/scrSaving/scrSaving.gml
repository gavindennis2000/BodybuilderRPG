// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function saveGame(){
	
	var _playerInfo = {
		
			pX: global.pX,
			pY: global.pY,
			roomVar: room
			
	}
	
	var _battleInfo = {
		
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
		var _array = json_parse(_json);
		
		global.pX = _playerInfo.pX;
		global.pY = _playerInfo.pY;
		global.roomVar = _playerInfo.roomVar;
		
	}
	if (file_exists("battleInfo.txt")) {
		
	}
}