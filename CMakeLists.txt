# This is a project to create a Windows 7 compatible version of the
# C++ interface to the netCDF 4.1.3 library. The Unidata network 
# Common Data Form (netCDF) is an interface for scientific data 
# access and a freely-distributed software library that
# provides an implementation of the interface.  
#
# The CMake utility will be used to create a platform independent 
# build script that will support both Windows and Unix.  If 
# successful, the goal is to turn this back over to Unidata as a 
# possible replacement for their current Autoconf based system. 
# There is not yet support in this script for the FORTRAN interface.
#
# The test platforms are:
#
# * Windows 7, 64-bit, Visual C++ 2010 Express Edition
# * Unubtu 10.04 LTS, 32-bit, GNU C++ 4.4.3
# 

cmake_minimum_required( VERSION 2.6 )
project( netcdf C CXX )

set( PACKAGE_VERSION_MAJOR 4 )
set( PACKAGE_VERSION_MINOR 1 )
set( PACKAGE_VERSION_PATCH 3 )
set( PACKAGE_VERSION ${PACKAGE_VERSION_MAJOR}.${PACKAGE_VERSION_MINOR}.${PACKAGE_VERSION_PATCH} )
set( VERSION PACKAGE_VERSION )

set( PACKAGE NetCDF)
set( PACKAGE_NAME "Unidata Network Common Data Form" )
set( PACKAGE_STRING "${PACKAGE_NAME} (${PACKAGE}) ${PACKAGE_VERSION}" )
set( PACKAGE_URL "http://www.unidata.ucar.edu/software/netcdf" )

#############################################
# USER CONFIGURED OPTIONS
# Uses the same order and defaults as "configure.ac" file

set( NCIO_MINBLOCKSIZE 256 CACHE STRING "specify minimum I/O blocksize for netCDF classic and 64-bit offset format files")
set( WITH_UDUNITS OFF CACHE BOOL "build udunits2 package")
set( ENABLE_FSYNC ON CACHE BOOL "include experimental fsync code.")
set( ENABLE_VALGRIND_TESTS OFF CACHE BOOL "build with valgrind-tests (valgrind is required, static builds only)")
set( ENABLE_NETCDF_4 ON CACHE BOOL "build with netcdf-4 (HDF5 and zlib required)")
set( WITH_LIBCF OFF CACHE BOOL "build and install libcf library (Requires netCDF-4 and HDF5)")
set( ENABLE_HDF4 OFF CACHE BOOL "build netcdf-4 with HDF4 read capability (HDF4, HDF5 and zlib required)")
set( ENABLE_HDF4_FILE_TESTS OFF CACHE BOOL "use wget to fetch some sample HDF4 data, and then test against it")
set( ENABLE_PNETCDF OFF CACHE BOOL "build netcdf-4 with parallel I/O for classic and 64-bit offset files using parallel-netcdf")
set( ENABLE_CXX_4 OFF CACHE BOOL "build with new netcdf-4 C++ API (requires ENABLE_NETCDF_4)")
set( ENABLE_EXTRA_EXAMPLE_TESTS OFF CACHE BOOL "run extra example tests; requires GNU sed. Ignored if netCDF-4 is not enabled")
set( ENABLE_PARALLEL_TESTS OFF CACHE BOOL "run extra parallel IO tests. (requires ENABLE_NETCDF_4, ENABLE_PNETCDF)")
set( DEFAULT_CHUNK_SIZE 4194304 CACHE STRING "default chunk size in bytes")
set( MAX_DEFAULT_CACHE_SIZE 67108864 CACHE STRING "max size of the default per-var chunk cache")
set( DEFAULT_CHUNKS_IN_CACHE 10 CACHE STRING "num chunks in default per-var chunk cache")
set( CHUNK_CACHE_SIZE 4194304 CACHE STRING "num chunks in default per-var chunk cache")
set( CHUNK_CACHE_NELEMS 1009 CACHE STRING "default file chunk cache nelems")
set( CHUNK_CACHE_PREEMPTION 0.75 CACHE STRING "default file chunk cache preemption policy")
set( LOGGING OFF CACHE BOOL "enable logging capability (requires ENABLE_NETCDF_4)")
set( ENABLE_CDMREMOTE OFF CACHE BOOL "build with cdmremote client support (requires CURL)")
set( ENABLE_DAP OFF CACHE BOOL "build with DAP client support (requires CURL)")
set( ENABLE_DAP_REMOTE_TESTS OFF CACHE BOOL "enable dap remote tests (requires ENABLE_DAP)")
set( ENABLE_EXTRA_TESTS OFF CACHE BOOL "run some extra tests that may not pass because of known issues")
set( ENABLE_FFIO OFF CACHE BOOL "use ffio instead of posixio (ex. on the Cray)")
set( ENABLE_EXAMPLES OFF CACHE BOOL "build the netCDF examples (treated as extra tests by netCDF)")
set( ENABLE_BUILD_F77 ON CACHE BOOL "build the netCDF Fortran 77 API")
set( ENABLE_FORTRAN_TYPE_CHECK ON CACHE BOOL "enables the Fortran type sizes checks")
set( ENABLE_BUILD_CXX ON CACHE BOOL "build the netCDF C++ API")
set( ENABLE_BUILD_V2 ON CACHE BOOL "turns on the netCDF version 2 API")
set( BUILD_UTILITIES OFF CACHE BOOL "build netCDF utilities ncgen, ncdump, and nccopy")
set( LARGE_FILE_TESTS OFF CACHE BOOL "[Run tests which create very large data files (~13 GB disk space required)")
set( ENABLE_BENCHMARKS OFF CACHE BOOL "run benchmarks experimental feature (requires data from Unidata ftp site)")
set( ENABLE_EXTREME_NUMBERS ON CACHE BOOL "use extreme numbers during testing, such as MAX_INT - 1")
set( TEMP_LARGE ${PROJECT_BINARY_DIR} CACHE PATH "Place to put very large netCDF test files.")

mark_as_advanced( NCIO_MINBLOCKSIZE ENABLE_FSYNC ENABLE_VALGRIND_TESTS 
    ENABLE_HDF4_FILE_TESTS ENABLE_EXTRA_EXAMPLE_TESTS ENABLE_PARALLEL_TESTS 
    DEFAULT_CHUNK_SIZE MAX_DEFAULT_CACHE_SIZE DEFAULT_CHUNKS_IN_CACHE 
    DEFAULT_CHUNKS_IN_CACHE DEFAULT_CHUNK_CACHE_SIZE CHUNK_CACHE_NELEMS 
    CHUNK_CACHE_PREEMPTION ENABLE_LOGGING ENABLE_DAP_REMOTE_TESTS
    ENABLE_EXTRA_TESTS ENABLE_FFIO ENABLE_EXAMPLES ENABLE_FORTRAN_TYPE_CHECK 
    ENABLE_LARGE_FILE_TESTS ENABLE_BENCHMARKS ENABLE_EXTREME_NUMBERS 
    LARGE_TEMP_DIR )

#############################################
# NETCDF 4.X DEPENDS ON PACKAGES ZLIB, SZIP, HDF5

# build links to ZLIB utility library
# uses the ZLIB_ROOT variable as a hint

if ( NOT DEFINED ${ZLIB_ROOT} ) 
    if ( EXISTS $ENV{ZLIB_ROOT} )
	set( ZLIB_ROOT $ENV{ZLIB_ROOT} CACHE PATH "Root directory for ZLIB" )
    endif()
endif()
find_package( ZLIB REQUIRED )
if( ZLIB_FOUND )
    include_directories( ${ZLIB_INCLUDE_DIRS} )
    set( USE_ZLIB YES )
endif( ZLIB_FOUND )

# build links to SZIP utility library
# uses the SZIP_INSTALL variable as a hint

if ( NOT DEFINED ${SZIP_INSTALL} ) 
    if ( EXISTS $ENV{SZIP_INSTALL} )
	set( SZIP_INSTALL $ENV{SZIP_INSTALL} CACHE PATH "Root directory for SZIP" )
    endif()
endif()
if ( NOT DEFINED SZIP_LIBRARY )
    find_package( SZIP REQUIRED )
    if( SZIP_FOUND )
        include_directories( ${SZIP_INCLUDE_DIRS} )
        set( USE_SZIP YES )
    endif( SZIP_FOUND )
endif( NOT DEFINED SZIP_LIBRARY )

# build links to HDF5 utility library
# uses the HDF5_ROOT variable as a hint

if ( NOT DEFINED ${HDF5_ROOT} ) 
    if ( EXISTS $ENV{HDF5_ROOT} )
	set( HDF5_ROOT $ENV{HDF5_ROOT} CACHE PATH "Root directory for HDF5" )
    endif()
endif()
find_package( HDF5 REQUIRED )
if( HDF5_FOUND )
    include_directories( ${HDF5_INCLUDE_DIRS} )
endif( HDF5_FOUND )

#############################################
# SYSTEM SPECIFIC CONFIGURATION
# Uses the same order "configure.h.cmake" file

include( CheckIncludeFile )
include( CheckLibraryExists )
include( CheckFunctionExists )
include( CheckTypeSize )
set( CMAKE_EXTRA_INCLUDE_FILES ${CMAKE_REQUIRED_INCLUDES}
     stddef.h sys/types.h )

CHECK_FUNCTION_EXISTS( alloca   HAVE_ALLOCA )
CHECK_INCLUDE_FILE( alloca.h    HAVE_ALLOCA_H )
CHECK_INCLUDE_FILE( ctype.h     HAVE_CTYPE_H )
# HAVE_CURLOPT_KEYPASSWD
CHECK_FUNCTION_EXISTS( isfinite HAVE_DECL_ISFINITE )
CHECK_FUNCTION_EXISTS( isinf    HAVE_DECL_ISINF )
CHECK_FUNCTION_EXISTS( isnan    HAVE_DECL_ISNAN )
CHECK_FUNCTION_EXISTS( signbit  HAVE_DECL_SIGNBIT )
CHECK_INCLUDE_FILE( dirent.h    HAVE_DIRENT_H )
CHECK_INCLUDE_FILE( dlfcn.h     HAVE_DLFCN_H )
CHECK_FUNCTION_EXISTS( vprintf  HAVE_VPRINTF )
if ( NOT HAVE_VPRINTF )
    CHECK_FUNCTION_EXISTS( _doprnt HAVE_DOPRNT )
endif ( NOT HAVE_VPRINTF )
CHECK_INCLUDE_FILE( errno.h     HAVE_ERRNO_H )
CHECK_INCLUDE_FILE( fcntl.h     HAVE_FCNTL_H )
CHECK_FUNCTION_EXISTS( fsync    HAVE_FSYNC )
CHECK_INCLUDE_FILE( getopt.h    HAVE_GETOPT_H )
CHECK_FUNCTION_EXISTS( getrlimit HAVE_GETRLIMIT )
CHECK_FUNCTION_EXISTS( gettimeofday HAVE_GETTIMEOFDAY )
CHECK_INCLUDE_FILE( hdf5.h      HAVE_HDF5_H HDF5_C_INCLUDE_DIR )
CHECK_FUNCTION_EXISTS( H5Pget_fapl_mpio HAVE_H5PGET_FAPL_MPIO )
CHECK_FUNCTION_EXISTS( H5Pget_fapl_mpiposix HAVE_H5PGET_FAPL_MPIPOSIX )
CHECK_FUNCTION_EXISTS( H5Pset_deflate HAVE_H5PSET_DEFLATE )
CHECK_FUNCTION_EXISTS( H5Z_SZIP HAVE_H5Z_SZIP )
CHECK_INCLUDE_FILE( inttypes.h  HAVE_INTTYPES_H )
# CHECK_LIBRARY_EXISTS( curl      HAVE_LIBCURL )
# CHECK_LIBRARY_EXISTS( df        HAVE_LIBDF )
# CHECK_LIBRARY_EXISTS( m         HAVE_LIBM )
# CHECK_LIBRARY_EXISTS( mfhdf     HAVE_LIBMFHDF )
# CHECK_LIBRARY_EXISTS( pnetcdf   HAVE_LIBPNETCDF )
CHECK_INCLUDE_FILE( locale.h    HAVE_LOCALE_H )
CHECK_TYPE_SIZE( longlong       LONGLONG )
CHECK_TYPE_SIZE("long long int" LONGLONGINT )
CHECK_INCLUDE_FILE( malloc.h    HAVE_MALLOC_H )
CHECK_INCLUDE_FILE( memory.h    HAVE_MALLOC_H )
CHECK_INCLUDE_FILE( mfhdf.h     HAVE_MFHDF_H )
CHECK_FUNCTION_EXISTS( mktemp   HAVE_MKTEMP )
CHECK_FUNCTION_EXISTS( MPI_Comm_f2c HAVE_MPI_COMM_F2C )
CHECK_INCLUDE_FILE( ndir.h      HAVE_NDIR_H )
CHECK_TYPE_SIZE( ptrdiff_t      HAVE_PTRDIFF_T )
CHECK_INCLUDE_FILE( rpc/types.h HAVE_RPC_TYPES_H )
CHECK_INCLUDE_FILE( rpc/xdr.h   HAVE_RPC_XDR_H )
CHECK_FUNCTION_EXISTS( snprintf HAVE_SNPRINTF )
CHECK_TYPE_SIZE( ssize_t        SSIZE_T )
CHECK_INCLUDE_FILE( stdarg.h    HAVE_STDARG_H )
CHECK_INCLUDE_FILE( stdbool.h   HAVE_STDBOOL_H )
CHECK_INCLUDE_FILE( stdint.h    HAVE_STDINT_H )
CHECK_INCLUDE_FILE( stdio.h     HAVE_STDIO_H )
CHECK_INCLUDE_FILE( stdlib.h    HAVE_STDLIB_H )
CHECK_INCLUDE_FILE( stdarg.h    HAVE_STDARG_H )
CHECK_FUNCTION_EXISTS( strcasecmp HAVE_STRCASECMP )
CHECK_FUNCTION_EXISTS( strcat   HAVE_STRCAT )
CHECK_FUNCTION_EXISTS( strchr   HAVE_STRCHR )
CHECK_FUNCTION_EXISTS( strcpy   HAVE_STRCPY )
CHECK_FUNCTION_EXISTS( strdup   HAVE_STRDUP )
CHECK_FUNCTION_EXISTS( strerror HAVE_STRERROR )
CHECK_INCLUDE_FILE( string.h    HAVE_STRING_H )
CHECK_FUNCTION_EXISTS( strlcat  HAVE_STRLCAT )
CHECK_FUNCTION_EXISTS( strrchr  HAVE_STRRCHR )
CHECK_FUNCTION_EXISTS( strtod   HAVE_STRTOD )
CHECK_FUNCTION_EXISTS( strtoll  HAVE_STRTOLL )
CHECK_FUNCTION_EXISTS( strtoull HAVE_STRTOULL )
# HAVE_STRUCT_STAT_ST_BLKSIZE
# HAVE_ST_BLKSIZE
CHECK_INCLUDE_FILE( sys/dir.h   HAVE_SYS_DIR_H )
CHECK_INCLUDE_FILE( sys/ndir.h  HAVE_SYS_NDIR_H )
CHECK_INCLUDE_FILE( sys/resource.h HAVE_SYS_RESOURCE_H )
CHECK_INCLUDE_FILE( sys/stat.h  HAVE_SYS_STAT_H )
CHECK_INCLUDE_FILE( sys/time.h  HAVE_SYS_TIME_H )
CHECK_INCLUDE_FILE( sys/types.h HAVE_SYS_TYPES_H )
CHECK_INCLUDE_FILE( sys/wait.h  HAVE_SYS_WAIT_H )
CHECK_TYPE_SIZE( uchar          UCHAR )
CHECK_INCLUDE_FILE( unistd.h    HAVE_UNISTD_H )
CHECK_TYPE_SIZE( "unsigned long long int" UNSIGNED_LONG_LONG_INT )
CHECK_TYPE_SIZE( _Bool          _BOOL )
CHECK_INCLUDE_FILE( ncconfig.h  HAVE_NCCONFIG_H )
CHECK_INCLUDE_FILE( sys/param.h HAVE_SYS_PARAM_H )

# for which compilers are these types now different?

set( STDC_HEADERS               YES )
set( TIME_WITH_SYS_TIME         NO )
set( NCBYTE_T                   "unsigned char" )
set( NCSHORT_T                  "short" )
set( NF_DOUBLEPRECISION_IS_C_DOUBLE YES )
set( NF_INT1_IS_C_SIGNED_CHAR   YES )
set( NF_INT1_T                  "char" )
set( NF_INT2_IS_C_SHORT         YES )
set( NF_INT2_T                  "short" )
set( NF_INT_IS_C_INT            YES )
set( NF_REAL_IS_C_FLOAT         YES )
set( NO_IEEE_FLOAT              NO )
set( NO_MINUS_C_MINUS_O         NO )
if ( NOT HAVE_STDLIB_H )
    set( NO_STDLIB_H YES )
endif ( NOT HAVE_STDLIB_H )
if ( NOT HAVE_SYS_TYPES_H )
    set( NO_SYS_TYPES_H YES )
endif ( NOT HAVE_SYS_TYPES_H )
if ( NOT ENABLE_BUILD_V2 )
    set( NO_NETCDF_2 YES )
endif ( NOT ENABLE_BUILD_V2 )

CHECK_TYPE_SIZE( double DOUBLE )
CHECK_TYPE_SIZE( float FLOAT )
CHECK_TYPE_SIZE( int INT )
CHECK_TYPE_SIZE( long LONG )
CHECK_TYPE_SIZE( short SHORT )

CHECK_TYPE_SIZE( off_t OFF_T )
if ( NOT HAVE_OFF_T  )
    if( NOT DEFINED NETCDF_DEFINED_OFF_T )
        message( STATUS "#define off_t long int" )
        set( NETCDF_DEFINED_OFF_T YES CACHE INTERNAL "Config overrides off_t" )
        # mark_as_advanced( NETCDF_DEFINED_OFF_T )
    endif( NOT DEFINED NETCDF_DEFINED_OFF_T )
    SET( off_t "long int" )
    SET( OFF_T ${LONG} )
endif ( NOT HAVE_OFF_T )

CHECK_TYPE_SIZE( size_t SIZE_T )
if ( NOT HAVE_SIZE_T )
    if( NOT DEFINED NETCDF_DEFINED_SIZE_T )
        message( STATUS "#define size_t unsigned int" )
        set( NETCDF_DEFINED_SIZE_T YES CACHE INTERNAL "Config overrides off_t" )
        # mark_as_advanced( NETCDF_DEFINED_SIZE_T )
    endif( NOT DEFINED NETCDF_DEFINED_SIZE_T )
    SET( size_t "unsigned int" )
    SET( SIZE_T ${INT} )
endif ( NOT HAVE_SIZE_T )

#############################################
# CREATE THE LIBRARIES

if( MSVC )                          # Visual Studio (2010) options
    set( BUILD_SHARED_LIBS OFF )
    # add_definitions( -DDLL_EXPORT )
    # add_definitions( -DDLL_NETCDF )
    add_definitions( -D_CRT_SECURE_NO_WARNINGS -wd4244 -wd4996 -wd4018 ) # quiet some harmless warning

else( CMAKE_COMPILER_IS_GNUCXX )	# GNU C++ options
    set( BUILD_SHARED_LIBS ON )

endif()

configure_file( 
    ${PROJECT_SOURCE_DIR}/config.h.cmake
    ${PROJECT_BINARY_DIR}/config.h )
include_directories( ${PROJECT_BINARY_DIR} )
include_directories( include )

add_subdirectory( libsrc )
if( ENABLE_NETCDF_4 )
    add_subdirectory( libsrc4 )
endif()
if( ENABLE_BUILD_CXX )
    add_subdirectory( cxx )
endif()
# if( ENABLE_BUILD_CXX AND ENABLE_CXX_4 AND ENABLE_NETCDF_4 )
#    add_subdirectory( cxx4 )
# endif()
