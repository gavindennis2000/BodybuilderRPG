// dev tools let's gavin make the game quicker

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (!TEST) { instance_destroy(); }

global.devTools = true;
global.ultimate = false;
showKeyEvents = false;
showDevTools = false;
live = false;

// gavin's stuff
global.keyEvents.meetSulik = true;
global.keyEvents.meetJim = true;
global.keyEvents.enterSulik = true;
global.silenceMusic = false;