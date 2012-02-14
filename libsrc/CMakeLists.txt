# CMakeList file for libsrc component of NetCDF

set ( SOURCES
    string.c v1hpg.c onstack.h rnd.h 
    nclistmgr.c putget.m4 attr.m4 nc3dispatch.c nc.c var.c
    dim.c ncx.m4 ncx.h lookup3.c pstdint.h )
# utf8proc.c utf8proc_data.h

if( ENABLE_FFIO )       # On systems like the CRAY, use ffio.
    list( APPEND SOURCES ffio.c )
else( ENABLE_FFIO )     # Otherwise use posixio.
    list( APPEND SOURCES posixio.c )
endif( ENABLE_FFIO )

add_library( netcdf ${SOURCES} )
