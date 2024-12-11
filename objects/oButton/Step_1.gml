/// @description Inherits

#region Inherit UI Container
    
    if(isio(parent,oUIContainer)) {
        
        active = parent.active
        hide = parent.hide
        gui_end = parent.gui_end
        depth = parent.depth-1
        
    }
    
#endregion