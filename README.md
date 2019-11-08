# plot_sort_drone_photos
Matlab code to create Google Earth kmls of dji drone photos &amp; sort photos to facilitate image processing 

find_jpgs_windows.m finds the drone photos within a polygon specificied by the user (polyx and Polyy) and writes 
the files to a new directory (folder). This code was written to help sort a large number of drone photos that cannot
be processed at once using software like Agisoft Photoscan or metashape. 

plot_drone_locs_kml_windows.m makes a kml of the positions of drone photos. Note the code is meant to be run on a day
or so of drone imagery (at most ~2000 photos). Matlab may have memory issues if you create a single kml for more photos. 
In this case, it is best to make multiple kml's, each for a subset of the imagery. 
