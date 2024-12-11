/// @description Init Globals/Meta Vars

#region Debug
	
	dbg = {
		
		on		: f,
		str		: "",
		str2    : "",
		strm	: 10,
		strw	: 0,
		strh	: 0,
		wd		: ww*.25
		
	}
	
#endregion

#region Surface
	
	swh = [0,0] // Surface W/H
	sxy = [0,0] // Surface X/Y
	
#endregion

#region Control Variables
	
	#region Game
		
		gstate = META.INIT
		gstateo = gstate
		
	#endregion
	
	#region Window
		
		winCtrl = f
		winResize = f
		winCloseBtn = noone
		
	#endregion
	
	#region Audio
		
		esfx = audio_emitter_create()
		emux = audio_emitter_create()
		eamx = audio_emitter_create()
		audio_emitter_gain(esfx,ss.vsfx*ss.vall)
		audio_emitter_gain(emux,ss.vmux*ss.vall)
		audio_emitter_gain(eamx,ss.vamx*ss.vall)
		
	#endregion
	
	#region Meta Overrides
		
		// Script Macro
		#macro mo meta_override()
		
		// Overrides
		guiOverride = f
		ntrOverride = f
		
	#endregion
	
	#region New Game Overrides
		
		resumeOverride = f
		
	#endregion
	
	#region Game Overrides
		
		
		
	#endregion
	
#endregion

#region Global Lists
	
	notifL = ds_list_create()
	msgL = ds_list_create()
	
#endregion

#region Game Lists
	
	scnL = ds_list_create()
	scnLDel  = noone
	scnLDeli = noone
	
#endregion

#region Confirm Initial Window Mode
	
	if(ss.winMode == WIN.FULL) window_set_fullscreen(t)
	else if(window_get_fullscreen()) window_set_fullscreen(f)
	if(ss.winMode == WIN.BFULL) window_set_size(dw,dh)
	else if(ss.winMode == WIN.WINDOW) window_set_size(dw*.75,dh*.75)
	
	// Center Window if Needed
	alarm[0] = room_speed/2
	
#endregion

#region Game Variables
	
	// Zoom
	z = 1
	zo = z
	zd = z-zo
	zmn = 1
	zmx = 20
	
	// World Object
	world = noone
	#macro w m.world
	
	// Player Object
	player = noone
	#macro p m.player
	
#endregion