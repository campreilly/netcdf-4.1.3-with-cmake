# CMakeList file for libsrc component of NetCDF

# search for source files in libsrc directory

set ( SOURCES ${PROJECT_BINARY_DIR}/config.h
    attr.c dim.c lookup3.c nc.c nc3dispatch.c nclistmgr.c 
    ncx.c ncx.h onstack.h pstdint.h putget.c rnd.h string.c 
    utf8proc.c utf8proc_data.h v1hpg.c var.c
    )

if( ENABLE_FFIO )       # On systems like the CRAY, use ffio.
    list( APPEND SOURCES ffio.c )
else( ENABLE_FFIO )     # Otherwise use posixio.
    list( APPEND SOURCES posixio.c )
endif( ENABLE_FFIO )

list( APPEND SOURCES ${PROJECT_SOURCE_DIR}/liblib/stub.c )

source_group( libsrc FILES ${SOURCES} ) 

# search for source files in libdispatch directory

include_directories( ${PROJECT_SOURCE_DIR}/libdispatch )
unset( DISPATCH_SOURCES )
foreach( FILE 
    att.c dim.c copy.c dispatch.c error.c file.c
    nc_uri.c ncbytes.c nchashmap.c nclist.c nclog.c nclog.h
    parallel.c v2i.c var.c )
    list( APPEND DISPATCH_SOURCES ${PROJECT_SOURCE_DIR}/libdispatch/${FILE} ) 
endforeach( FILE )
source_group( libdispatch FILES ${DISPATCH_SOURCES} ) 
list( APPEND SOURCES ${DISPATCH_SOURCES} )

# create netcdf library

add_library( netcdf ${SOURCES} )
