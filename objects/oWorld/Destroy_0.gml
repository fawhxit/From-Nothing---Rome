/// @description Free Surfaces & DSes & Childs

// Noise Grid Destroys
if(ds_exists(trnGrid,ds_type_grid)) ds_grid_destroy(trnGrid)
if(ds_exists(dstGrid,ds_type_grid)) ds_grid_destroy(dstGrid)
if(ds_exists(snwGrid,ds_type_grid)) ds_grid_destroy(snwGrid)
if(ds_exists(skyGrid,ds_type_grid)) ds_grid_destroy(skyGrid)

// World Layer Destroys
if(iso(wtrLyr,oWorldLayer)) instance_destroy(wtrLyr)
if(iso(lndLyr,oWorldLayer)) instance_destroy(lndLyr)
if(iso(trnFLyr,oWorldLayer)) instance_destroy(trnFLyr)
if(iso(skyLyr,oWorldLayer)) instance_destroy(skyLyr)