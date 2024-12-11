/// @description Init Button Vars

// Basic
parent = noone
active  = f
init = f
initd = f
in_room = room

// Body
action  = UI.NONE
xy4      = [ww*(1/3),wh*(2/3),ww*(2/3),wh*.97]
xy4pct   = noone
prestr = irandom(3)
switch(prestr) {
	
	case 0:
		prestr = "Regulus!"
	break
	
	case 1:
		prestr = "Basileus!"
	break
	
	case 2:
		prestr = "Princeps!"
	break
	
	case 3:
		prestr = "Praetor!"
	break
	
}
str     = "Message"
strm    = 20
strf    = fTeleM
strhva  = [fa_center,fa_middle]
strscl  = 1

// Color
fgc5 = [1,c.blk,c.blk,c.dgry,c.dgry]
bgc5 = [1,c.lscr,c.lscr,c.dscr,c.dscr]
strc5 = fgc5

// Delay
del  = noone
deli = noone

// FX
fade = room_speed/2
fadei = noone
fadeD = f

// Watcher Arrays
wt = noone // Watcher Triggers
wa = noone // Watcher Actions