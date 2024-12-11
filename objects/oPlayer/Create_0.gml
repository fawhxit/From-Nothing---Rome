
// Basic
parent = noone
active  = f
init = f
initd = f
in_room = room

#region Territory Vars
	
	// ?
	tFirst = f
	
	// Base Territory Vars
	tbounds = noone
	txy2 = noone
	tGrid = noone
	tSurf = noone
	tSurfI = t
	
	// Territory Limits
	tVll = noone
	tVul = noone
	
	// Sweep Vars
	tSwpxy2 = noone
	tSwpDel = 5
	tSwpDeli = 0
	tSwpCnt = 0
	
	// City List
	cityL = noone
	
	// Farthest Coors
	ltrb = [noone,noone,noone,noone]
	tFarDist = noone
	
#endregion

#region New Game Vars
    
    startxy2pct = noone
    startxy2	= noone
    startConfirm = f
    firstDraw = t
    
    #region New Game Help
        
        ds_list_add(m.notifL,instance_create_layer(0,0,"Meta",oNotify))
        var n = list_pop(m.notifL)
        n.parent = id
        n.str = "Search for a starting location and left click to select."
            +"\n\nPress 'E' or Enter to Confirm Selection and Begin."
        n.del = room_speed*30
        n.strf = fTeleM
        n.fgc5 = [1,c.blk,c.blk,c.dgry,c.dgry]
        n.bgc5 = [1,c.lscr,c.lscr,c.dscr,c.dscr]
        n.strc5 = n.fgc5
        n.initd = t
        n.wt = WATCHER.INIT_PARENT
        n.wa = ACTION.DESTROY_SELF
        n.alarm[0] = 1
        
    #endregion
    
#endregion