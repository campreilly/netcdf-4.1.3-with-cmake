# CMakeList file for nctest component of NetCDF

set ( SOURCES
add.c
add.h
atttests.c
cdftests.c
dimtests.c
driver.c
emalloc.c
emalloc.h
error.c
error.h
misctest.c
rec.c
slabs.c
testcdf.h
tests.h
val.c
val.h
vardef.c
varget.c
vargetg.c
varput.c
varputg.c
vartests.c
vputget.c
vputgetg.c )

add_executable( nctest ${SOURCES} )
target_link_libraries( nctest netcdf )
