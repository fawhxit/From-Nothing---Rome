
if(isia(id)) {
    
    // GUI Override (Prevent Click-Through)
    if(mouse_in_gui_rectangle(xy4))
        m.guiOverride = t
    
    // Enter Override
    m.ntrOverride = t
    
    // Run Watcher Check
    watcher_check(id)
    
}