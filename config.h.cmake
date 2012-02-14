/* config.h.  Generated from config.h.cmake by CMake.  */

/* Define if building universal (internal helper macro) */
#cmakedefine AC_APPLE_UNIVERSAL_BUILD

/* default file chunk cache nelems. */
#cmakedefine CHUNK_CACHE_NELEMS @CHUNK_CACHE_NELEMS@

/* default file chunk cache preemption policy. */
#cmakedefine CHUNK_CACHE_PREEMPTION @CHUNK_CACHE_PREEMPTION@

/* default file chunk cache size in bytes. */
#cmakedefine CHUNK_CACHE_SIZE @CHUNK_CACHE_SIZE@

/* Define to one of `_getb67', `GETB67', `getb67' for Cray-2 and Cray-YMP
   systems. This function is required for `alloca.c' support on those systems.
   */
#cmakedefine CRAY_STACKSEG_END @CRAY_STACKSEG_END@

/* Define to 1 if using `alloca.c'. */
#cmakedefine C_ALLOCA 1

/* num chunks in default per-var chunk cache. */
#cmakedefine DEFAULT_CHUNKS_IN_CACHE @DEFAULT_CHUNKS_IN_CACHE@

/* default chunk size in bytes */
#cmakedefine DEFAULT_CHUNK_SIZE @DEFAULT_CHUNK_SIZE@

/* set this only when building a DLL under MinGW */
#cmakedefine DLL_NETCDF

/* if true, build DAP Client */
#cmakedefine ENABLE_DAP

/* if true, do remote tests */
#cmakedefine ENABLE_DAP_REMOTE_TESTS

/* if true, run extra tests which may not work yet */
#cmakedefine EXTRA_TESTS

/* use HDF5 1.6 API */
#cmakedefine H5_USE_16_API

/* Define to 1 if you have `alloca', as a function or macro. */
#cmakedefine HAVE_ALLOCA 1

/* Define to 1 if you have <alloca.h> and it should be used (not on Ultrix).
   */
#cmakedefine HAVE_ALLOCA_H 1

/* Define to 1 if you have the <ctype.h> header file. */
#cmakedefine HAVE_CTYPE_H 1

/* Is CURLOPT_KEYPASSWD defined */
#cmakedefine HAVE_CURLOPT_KEYPASSWD

/* Define to 1 if you have the declaration of `isfinite', and to 0 if you
   don't. */
#cmakedefine HAVE_DECL_ISFINITE 1

/* Define to 1 if you have the declaration of `isinf', and to 0 if you don't.
   */
#cmakedefine HAVE_DECL_ISINF 1

/* Define to 1 if you have the declaration of `isnan', and to 0 if you don't.
   */
#cmakedefine HAVE_DECL_ISNAN 1

/* Define to 1 if you have the declaration of `signbit', and to 0 if you
   don't. */
#cmakedefine HAVE_DECL_SIGNBIT 1

/* Define to 1 if you have the <dirent.h> header file, and it defines `DIR'.
   */
#cmakedefine HAVE_DIRENT_H 1

/* Define to 1 if you have the <dlfcn.h> header file. */
#cmakedefine HAVE_DLFCN_H 1

/* Define to 1 if you don't have `vprintf' but do have `_doprnt.' */
#cmakedefine HAVE_DOPRNT 1

/* Define to 1 if you have the <errno.h> header file. */
#cmakedefine HAVE_ERRNO_H 1

/* Define to 1 if you have the <fcntl.h> header file. */
#cmakedefine HAVE_FCNTL_H 1

/* Define to 1 if you have the `fsync' function. */
#cmakedefine HAVE_FSYNC 1

/* Define to 1 if you have the <getopt.h> header file. */
#cmakedefine HAVE_GETOPT_H 1

/* Define to 1 if you have the `getrlimit' function. */
#cmakedefine HAVE_GETRLIMIT 1

/* Define to 1 if you have the `gettimeofday' function. */
#cmakedefine HAVE_GETTIMEOFDAY 1

/* Define to 1 if you have the `H5Pget_fapl_mpio' function. */
#cmakedefine HAVE_H5PGET_FAPL_MPIO 1

/* Define to 1 if you have the `H5Pget_fapl_mpiposix' function. */
#cmakedefine HAVE_H5PGET_FAPL_MPIPOSIX 1

/* Define to 1 if you have the `H5Pset_deflate' function. */
#cmakedefine HAVE_H5PSET_DEFLATE 1

/* Define to 1 if you have the `H5Z_SZIP' function. */
#cmakedefine HAVE_H5Z_SZIP 1

/* Define to 1 if you have the <hdf5.h> header file. */
#cmakedefine HAVE_HDF5_H 1

/* Define to 1 if you have the <inttypes.h> header file. */
#cmakedefine HAVE_INTTYPES_H 1

/* Define to 1 if you have the `curl' library (-lcurl). */
#cmakedefine HAVE_LIBCURL 1

/* Define to 1 if you have the `df' library (-ldf). */
#cmakedefine HAVE_LIBDF 1

/* Define to 1 if you have the `m' library (-lm). */
#cmakedefine HAVE_LIBM 1

/* Define to 1 if you have the `mfhdf' library (-lmfhdf). */
#cmakedefine HAVE_LIBMFHDF 1

/* Define to 1 if you have the `pnetcdf' library (-lpnetcdf). */
#cmakedefine HAVE_LIBPNETCDF 1

/* Define to 1 if you have the <locale.h> header file. */
#cmakedefine HAVE_LOCALE_H 1

/* Define to 1 if the system has the type `longlong'. */
#cmakedefine HAVE_LONGLONG 1

/* Define to 1 if the system has the type `long long int'. */
#cmakedefine HAVE_LONG_LONG_INT 1

/* Define to 1 if you have the <malloc.h> header file. */
#cmakedefine HAVE_MALLOC_H 1

/* Define to 1 if you have the <memory.h> header file. */
#cmakedefine HAVE_MEMORY_H 1

/* Define to 1 if you have the <mfhdf.h> header file. */
#cmakedefine HAVE_MFHDF_H 1

/* Define to 1 if you have the `mktemp' function. */
#cmakedefine HAVE_MKTEMP 1

/* Define to 1 if you have the `MPI_Comm_f2c' function. */
#cmakedefine HAVE_MPI_COMM_F2C 1

/* Define to 1 if you have the <ndir.h> header file, and it defines `DIR'. */
#cmakedefine HAVE_NDIR_H 1

/* Define to 1 if the system has the type `ptrdiff_t'. */
#cmakedefine HAVE_PTRDIFF_T 1

/* no rpc/types.h */
#cmakedefine HAVE_RPC_TYPES_H

/* no rpc/xdr.h */
#cmakedefine HAVE_RPC_XDR_H

/* Define to 1 if you have the `snprintf' function. */
#cmakedefine HAVE_SNPRINTF 1

/* Define to 1 if the system has the type `ssize_t'. */
#cmakedefine HAVE_SSIZE_T 1

/* Define to 1 if you have the <stdarg.h> header file. */
#cmakedefine HAVE_STDARG_H 1

/* Define to 1 if stdbool.h conforms to C99. */
#cmakedefine HAVE_STDBOOL_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#cmakedefine HAVE_STDINT_H 1

/* Define to 1 if you have the <stdio.h> header file. */
#cmakedefine HAVE_STDIO_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#cmakedefine HAVE_STDLIB_H 1

/* Define to 1 if you have the `strcasecmp' function. */
#cmakedefine HAVE_STRCASECMP 1

/* Define to 1 if you have the `strcat' function. */
#cmakedefine HAVE_STRCAT 1

/* Define to 1 if you have the `strchr' function. */
#cmakedefine HAVE_STRCHR 1

/* Define to 1 if you have the `strcpy' function. */
#cmakedefine HAVE_STRCPY 1

/* Define to 1 if you have the `strdup' function. */
#cmakedefine HAVE_STRDUP 1

/* Define to 1 if you have the `strerror' function. */
#cmakedefine HAVE_STRERROR 1

/* Define to 1 if you have the <strings.h> header file. */
#cmakedefine HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#cmakedefine HAVE_STRING_H 1

/* Define to 1 if you have the `strlcat' function. */
#cmakedefine HAVE_STRLCAT 1

/* Define to 1 if you have the `strrchr' function. */
#cmakedefine HAVE_STRRCHR 1

/* Define to 1 if you have the `strtod' function. */
#cmakedefine HAVE_STRTOD 1

/* Define to 1 if you have the `strtoll' function. */
#cmakedefine HAVE_STRTOLL 1

/* Define to 1 if you have the `strtoull' function. */
#cmakedefine HAVE_STRTOULL 1

/* Define to 1 if `st_blksize' is a member of `struct stat'. */
#cmakedefine HAVE_STRUCT_STAT_ST_BLKSIZE 1

/* Define to 1 if your `struct stat' has `st_blksize'. Deprecated, use
   `HAVE_STRUCT_STAT_ST_BLKSIZE' instead. */
#cmakedefine HAVE_ST_BLKSIZE 1

/* Define to 1 if you have the <sys/dir.h> header file, and it defines `DIR'.
   */
#cmakedefine HAVE_SYS_DIR_H 1

/* Define to 1 if you have the <sys/ndir.h> header file, and it defines `DIR'.
   */
#cmakedefine HAVE_SYS_NDIR_H 1

/* Define to 1 if you have the <sys/resource.h> header file. */
#cmakedefine HAVE_SYS_RESOURCE_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#cmakedefine HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#cmakedefine HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#cmakedefine HAVE_SYS_TYPES_H 1

/* Define to 1 if you have <sys/wait.h> that is POSIX.1 compatible. */
#cmakedefine HAVE_SYS_WAIT_H 1

/* Define to 1 if the system has the type `uchar'. */
#cmakedefine HAVE_UCHAR 1

/* Define to 1 if you have the <unistd.h> header file. */
#cmakedefine HAVE_UNISTD_H 1

/* Define to 1 if the system has the type `unsigned long long int'. */
#cmakedefine HAVE_UNSIGNED_LONG_LONG_INT 1

/* Define to 1 if you have the `vprintf' function. */
#cmakedefine HAVE_VPRINTF 1

/* Define to 1 if the system has the type `_Bool'. */
#cmakedefine HAVE__BOOL 1

/* do large file tests */
#cmakedefine LARGE_FILE_TESTS

/* If true, turn on logging. */
#cmakedefine LOGGING

/* Define to the sub-directory in which libtool stores uninstalled libraries.
   */
#cmakedefine LT_OBJDIR @LT_OBJDIR@

/* max size of the default per-var chunk cache. */
#cmakedefine MAX_DEFAULT_CACHE_SIZE @MAX_DEFAULT_CACHE_SIZE@

/* type definition */
#cmakedefine NCBYTE_T @NCBYTE_T@

/* min blocksize for posixio. */
#cmakedefine NCIO_MINBLOCKSIZE @NCIO_MINBLOCKSIZE@

/* type definition */
#cmakedefine NCSHORT_T @NCSHORT_T@

/* default */
#cmakedefine NF_DOUBLEPRECISION_IS_C_DOUBLE

/* default */
#cmakedefine NF_INT1_IS_C_SIGNED_CHAR

/* type thing */
#cmakedefine NF_INT1_T @NF_INT1_T@

/* default */
#cmakedefine NF_INT2_IS_C_SHORT

/* type thing */
#cmakedefine NF_INT2_T @NF_INT2_T@

/* default */
#cmakedefine NF_INT_IS_C_INT

/* default */
#cmakedefine NF_REAL_IS_C_FLOAT

/* no IEEE float on this platform */
#cmakedefine NO_IEEE_FLOAT

/* Define to 1 if your C compiler doesn't accept -c and -o together. */
#cmakedefine NO_MINUS_C_MINUS_O 1

/* do not build the netCDF version 2 API */
#cmakedefine NO_NETCDF_2

/* no stdlib.h */
#cmakedefine NO_STDLIB_H

/* no sys_types.h */
#cmakedefine NO_SYS_TYPES_H

/* Name of package */
#cmakedefine PACKAGE @PACKAGE@

/* Define to the address where bug reports for this package should be sent. */
#cmakedefine PACKAGE_BUGREPORT @PACKAGE_BUGREPORT@

/* Define to the full name of this package. */
#cmakedefine PACKAGE_NAME "@PACKAGE_NAME@"

/* Define to the full name and version of this package. */
#cmakedefine PACKAGE_STRING "@PACKAGE_STRING@"

/* Define to the one symbol short name of this package. */
#cmakedefine PACKAGE_TARNAME "@PACKAGE_TARNAME@"

/* Define to the home page for this package. */
#cmakedefine PACKAGE_URL "@PACKAGE_URL@"

/* Define to the version of this package. */
#define PACKAGE_VERSION @PACKAGE_VERSION@

/* The size of `double', as computed by sizeof. */
#define SIZEOF_DOUBLE @DOUBLE@

/* The size of `float', as computed by sizeof. */
#define SIZEOF_FLOAT @FLOAT@

/* The size of `int', as computed by sizeof. */
#define SIZEOF_INT @INT@

/* The size of `long', as computed by sizeof. */
#define SIZEOF_LONG @LONG@

/* The size of `off_t', as computed by sizeof. */
#define SIZEOF_OFF_T @OFF_T@

/* The size of `short', as computed by sizeof. */
#define SIZEOF_SHORT @SHORT@

/* The size of `size_t', as computed by sizeof. */
#define SIZEOF_SIZE_T @SIZE_T@

/* If using the C implementation of alloca, define if you know the
   direction of stack growth for your system; otherwise it will be
   automatically deduced at runtime.
	STACK_DIRECTION > 0 => grows toward higher addresses
	STACK_DIRECTION < 0 => grows toward lower addresses
	STACK_DIRECTION = 0 => direction of growth unknown */
#cmakedefine STACK_DIRECTION

/* Define to 1 if you have the ANSI C header files. */
#cmakedefine STDC_HEADERS 1

/* Place to put very large netCDF test files. */
#cmakedefine TEMP_LARGE "@TEMP_LARGE@"

/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#cmakedefine TIME_WITH_SYS_TIME 1

/* if true, build CDMREMOTE Client */
#cmakedefine USE_CDMREMOTE

/* if true, build DAP Client */
#cmakedefine USE_DAP

/* set this to use extreme numbers in tests */
#cmakedefine USE_EXTREME_NUMBERS

/* if true, include experimental fsync code */
#cmakedefine USE_FSYNC

/* if true, use HDF4 too */
#cmakedefine USE_HDF4

/* If true, use use wget to fetch some sample HDF4 data, and then test against
   it. */
#cmakedefine USE_HDF4_FILE_TESTS

/* if true, build netCDF-4 */
#cmakedefine USE_NETCDF4 1

/* if true, parallel netCDF-4 is in use */
#cmakedefine USE_PARALLEL 1

/* if true, compile in parallel netCDF-4 based on MPI/IO */
#cmakedefine USE_PARALLEL_MPIO 1

/* if true, compile in parallel netCDF-4 based on MPI/POSIX */
#cmakedefine USE_PARALLEL_POSIX 1

/* if true, parallel netCDF is used */
#cmakedefine USE_PNETCDF 1

/* if true, compile in szip compression in netCDF-4 variables */
#cmakedefine USE_SZIP 1

/* if true, compile in zlib compression in netCDF-4 variables */
#cmakedefine USE_ZLIB 1

/* Version number of package */
#cmakedefine VERSION @PACKAGE_VERSION@

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
#  undef WORDS_BIGENDIAN
# endif
#endif

/* Number of bits in a file offset, on hosts where this is settable. */
#cmakedefine _FILE_OFFSET_BITS

/* Define for large files, on AIX-style hosts. */
#cmakedefine _LARGE_FILES

/* Define to 1 if type `char' is unsigned and you are not using gcc.  */
#ifndef __CHAR_UNSIGNED__
# undef __CHAR_UNSIGNED__
#endif

/* Define to empty if `const' does not conform to ANSI C. */
#cmakedefine const

/* Turned on by netCDF configure. */
#cmakedefine f2cFortran @f2cFortran@

/* Turned on by netCDF configure. */
#cmakedefine gFortran @gFortran@

/* Define to `long int' if <sys/types.h> does not define. */
#cmakedefine off_t @off_t@

/* Turned on by netCDF configure. */
#cmakedefine pgiFortran @pgiFortran@

/* Define to `unsigned int' if <sys/types.h> does not define. */
#cmakedefine size_t @size_t@
