/// @description Destroy Childeren

// Grids
if(ds_exists(grid,ds_type_grid))
    ds_grid_destroy(grid)

// Surfaces
if(surface_exists(surf1))
    surface_free(surf1)
if(surface_exists(surf2))
    surface_free(surf2)