/* Zak Autosplitter v0.1
 * by Stuienator
 *
 * Features:
 * - Splits on entry to levels 4,7,11,15
 * - Final split on killing boss on last level.
 *
 * To do:
 * - Add option to move second split to level 8 checkpoint
 * - Add auto start
 * - - Need to find variable that triggers starting animation?
 * - Fix auto reset
*/

state("Zak"){
	int level : "mono.dll", 0x1F60D4, 0x9C4, 0x4;
	int bossDead : "mono.dll", 0x1F60D4, 0x50C, 0x4, 0x9BC;
}

//startup{}

//start{}

split{
	// This is what I'd love to do if I could figure out how to put an array in vars:
	//	if (current.level == vars.levelSplits[vars.splity]){
	//		splity++;
	//		return true;
	//	}
	
	if (current.level == old.level){
	}
	else if (current.level == 4 || current.level == 7 || current.level == 11 || current.level == 15){
		return true;
	}

	if (current.level == 17 && current.bossDead == 1){
		return true;
	}
}

reset{
	/* I'd like to consider making it split whenever level changes to anything except old level+1
	 * But I was having difficulties, it seemed to be resetting on random allowed level transitions.
	 * I suspect the level variable might become some weird value for a brief moment during transition? I'm not sure.
	 * Note that if this change is implemented successfully, an extra level == 0 check should be necessary, because the credits scene has level value -1.
	 * I've also commented out even this simple "reset if level becomes 0" code because I had a feeling that something wasn't working properly and I couldn't be bothered sorting it out, something for the next version of the autosplitter.
	*/

	// Runs before split

//	if (current.level == old.level){
//	}
//	else if (current.level == 0){
//		return true;
//	}
}





