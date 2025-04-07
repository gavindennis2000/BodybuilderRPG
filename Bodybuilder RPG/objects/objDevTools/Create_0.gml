// dev tools let's gavin make the game quicker

#macro FIRSTROOM rSpace

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (!TEST) { instance_destroy(); }

global.devTools = true;
global.ultimate = false;
showKeyEvents = false;
showDevTools = false;
live = false;

/* gavin's stuff below */

global.chapter = 0;
global.outfit.color = 1;
global.outfit.hair = 4;
global.outfit.hairColor = 0;

// global.keyEvents.meetSulik = true;
// global.keyEvents.meetJim = true;
// global.keyEvents.enterSulik = true;
global.silenceMusic = false;