# CMakeList file for cxx4 component of NetCDF

set ( SOURCES
    nc4dispatch.c nc4dispatch.H
    
    nc4attr.c nc4dim.c nc4file.c nc4grp.c nc4type.c nc4var.c ncfunc.c
    
    nc4internal.c nc4hdf.c error4.c )
    # nc4internal.h 
	
add_library( netcdf_c++4 ${SOURCES} )
