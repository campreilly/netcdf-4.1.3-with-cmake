# CMakeList file for libsrc4 component of NetCDF

set ( SOURCES
    nc4internal.h nc4dispatch.c nc4dispatch.h
    nc4attr.c nc4dim.c nc4file.c nc4grp.c nc4type.c nc4var.c ncfunc.c
    nc4internal.c nc4hdf.c error4.c )

add_library( netcdf4 ${SOURCES} )
