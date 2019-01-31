# Okvis – building to Windows – VS15 (2017), v141, x64

#	External dependencies:

##	Boost:
- Download 1.68.0 version from: https://dl.bintray.com/boostorg/release/1.68.0/source/

- Substitute the content in bootstrap.bat file for https://github.com/Studiofreya/boost-build-scripts/blob/master/build_boost_1_68_vs2017.5.bat
- Double click in the new bootstrap.bat file

##	Eigen: 
- Download 3.3.X version from http://eigen.tuxfamily.org/index.php?title=Main_Page

##	Glog:
- Download 0.3.5 version from https://github.com/google/glog/releases
- Open google-glo.sln
- In libglog project open logging.cc and after all includes add:

        #define NOMINMAX
        #include <windows.h>
        #include <algorithm>
        
-  In libglog project open port.cc and after all includes comment the entire function 

        Int snprintf(...)
    
  - In libglog project open port.h and comment the line :

        extern int GOOGLE_GLOG_DLL_DECL snprintf(char *str, size_t size, const char *format, ...);
    
  - Build libglog project on Debug and Release in x64 configuration 

## OpenCV:
- Download 2.4.13 version from https://opencv.org/releases.html
- Use CMake to generate the project. Set the source and build folders to (OPENCV_PATH)/ and (OPENCV_PATH)/build, respectively
- Click in “configure” and set the generator to “Visual Studio 15 2017 Win64” and then click in “Finish”
- Uncheck “BUILD_TEST”, click in “configure” and then in “generate”

- Open the *.sln file generated and build ALL BUILD and INSTALL project on Debug and Release in x64 configuration 

## Suite Sparse, CXSparse, Bras and Lapack:
- Download from https://github.com/jlblancoc/suitesparse-metis-for-windows 
- Use CMake to generate the project. Set the source and build folders to (SUITE_SPARSE_PATH)/ and (SUITE_SPARSE_PATH)/build, respectively
- Click in “configure” and set the generator to “Visual Studio 15 2017 Win64” and then click in “finish”
- Click in “generate” 

- Open the *.sln file generated and build ALL BUILD and INSTALL projects on Debug and Release in x64 configuration 

## Ceres solver
- Download from https://github.com/ceres-solver/ceres-solver 
- Use CMake to generate the project. Set the source and build folders to (CERES_PATH)/ and (CERES_PATH)/build, respectively

- Click in “configure” and set the generator to “Visual Studio 15 2017 Win64” and then click in “finish”
- Uncheck BUILD_EXAMPLES and BUILD_TESTING, change the CMAKE_INSTALL_PREIFIX to point to (CERES_PATH)/build/install, set the EIGEN_INCLUDE_DIR to (EIGEN_PATH)/ and click in “configure” 
- Set GLOG_INCLUDE_DIR to (GLOG_PATH)/src/windows and click in “configure”
- Set GLOG_LIBRARY to (GLOG_PATH)/x64/Release/libglog.lib and click in “configure” and then in “generate” 
- Open the *.sln file generated and build ALL BUILD and INSTALL projects on Debug and Release in x64 configuration 

## OpenGV
- Download from https://github.com/ethz-asl/opengv

- Use CMake to generate the project. Set the source and build folders to (OPENGV_PATH)/ and (OPENGV_PATH)/build, respectively
- Click in “configure”, set the generator to “Visual Studio 15 2017 Win64” and then click in “finish”
- Click in “generate” 
- Open the *.sln file generated and build opengv project on Debug and Release in x64 configuration 

## OKVIS

- Download from https://github.com/ethz-asl/okvis

- Use CMake to generate the project. Set the source and build folders to (OKVIS_PATH)/ and (OKVIS_PATH)/build, respectively
- EIGEN_INCLUDE_DIR to (EIGEN_PATH)/ and click in “configure”
- Set GLOG_INCLUDE_DIR to (GLOG_PATH)/src/windows and click in “configure”
- Set GLOG_LIBRARY to (GLOG_PATH)/x64/Release/libglog.lib and click in “configure”
___
- Set AMD_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/AMD and AMD_LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libamd.lib

- Set CAMD_INCLUDE_DIR to (SUITESPARSE)/SuiteSparse/CAMD and AMD_LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libcamd.lib
- Set CCOLAMD_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/CCOLAMD and CCOLAMD _LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libccolamd.lib
- Set COLAMD_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/COLAMD and COLAMD _LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libcolamd.lib
- Set CHOLMOD_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/CHOLMOD and CHOLMOD _LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libcholmod.lib
- Set SUITESPARSE_CONFIG_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/SuiteSparse_config and SUITESPARSE_CONFIG _LIBRARY to (SUITE_SPARSE_PATH)/build/Release/suitesparseconfig.lib
- Set SUITESPARSEQR_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/SPQR and SUITESPARSEQR _LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libspqr.lib
- Set BRAS_bras _LIBRARY to (SUITE_SPARSE_PATH)/build/install/lib64/lapack_blas_windows/libblas.lib and click in “configure”
___
- Set LAPACK_lapack _LIBRARY to (SUITESPARSE)/build/install/lib64/lapack_blas_windows/liblapack.lib and click in “configure”

- Set CXSPARSE_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/CXSparse and CXSPARSE_LIBRARY to (SUITESPARSE)/build/Release/libcxsparse.lib and click in “configure”
- Set 	OpenCV_DIR to (OPENCV_PATH)/build and click in “configure"
___
- Set boost_INCLUDE_DIR to (BOOST_DIR), set boost_FILESYSTEM_LIBRARY_DEBUG to (BOOST_DIR)/bin.v2/libs/filesystem/build/msvc-14.1/debug/address-model-64/link-static/threading-multi/libboost_filesystem-vc141-mt-gd-x64-1_68.lib

- Set boost_FILESYSTEM_LIBRARY_RELEASE to (BOOST_DIR)/bin.v2/libs/filesystem/build/msvc-14.1/release/address-model-64/link-static/threading-multi/libboost_filesystem-vc141-mt-x64-1_68.lib
- Set boost_SYSTEM_LIBRARY_DEBUG to (BOOST_DIR) /bin.v2/libs/system/build/msvc-14.1/debug/address-model-64/link-static/threading-multi/libboost_system-vc141-mt-gd-x64-1_68.lib 
- Set boost_SYSTEM_LIBRARY_RELEASE to (BOOST_DIR)/bin.v2/libs/system/build/msvc-14.1/release/address-model-64/link-static/threading-multi/libboost_system-vc141-mt-x64-1_68.lib and click in “configure” and then in “generate”		

## Brisk
- In (OKVIS_PATH)/build/brisk/src extract brisk.zip 
- Use CMake to generate the project. Set the source and build folders to (BRISK_PATH)/ and (BRISK_PATH)/build, respectively
- Click in “configure” and set the generator to “Visual Studio 15 2017 Win64” and then click in “finish”
- Set OpenCV_DIR to (OPENCV_PATH)/build and click in “configure” and then in “generate”		
- Open the *.sln file generated
- Right click in brisk project > Properties > C/C++ > Command Line and remove the content in Additional Properties
- Right click in agast project > Properties > C/C++ > Command Line and remove the content in Additional Properties
- Right click in demo project and remove it
- In brisk project > External Dependencies, open Macros.h and add:
 
        #define INT32_ALIAS signed int
    inside of: 

        #ifdef _MSC_VER 
- In brisk project > Source Files, open brisk-descriptor-extractor.cc and look for the line:

        brisk::UINT32_ALIAS* ptr2 = reinterpret_cast<brisk::UINT32_ALIAS*>(ptr);

    and remove both “brisk::”
- Build brisk project on Debug and Release in x64 configuration 

## OKVIS solution

- Open the *.sln generated
- Right click in brisk_external project and remove it 
- Right click in ceres_external project and remove it
- Right click in opengv_external project and remove it

    ### Util project
- Build okvis_util project on Debug and Release in x64 configuration 

    ### Time project
- Build okvis_time project on Debug and Release in x64 configuration 

    ### Kinematics project
- Build okvis_kinematics project on Debug and Release in x64 configuration 
- In okvis_cv project > External Dependencies > implementation/transformation.hpp change all 

        __inline__ 
    to 

        inline

    ### Matcher project
- Build okvis_matcher project on Debug and Release in x64 configuration 

    ### Cv project
- Right click in okvis_cv project > Properties > C/C++ > Preprocessor > Preprocessor Definitions and add 

        _USE_MATH_DEFINES 
    in Debug and Release configuration
- Build okvis_cv project on Debug and Release in x64 configuration 

    ### Common project
    
- Right click in okvis_common project > Properties > C/C++ > General > Additional Include Directories and add in Debug and Release configuration:
    - (CERES_SOLVER_DIR)/build/install/include
    - (OPENCV_DIR)/build/install/include 

- Right click in okvis_common project > Properties > C/C++ > Preprocessor > Preprocessor Definitions and add 

        _USE_MATH_DEFINES 
    in Debug and Release configuration

- Build okvis_common project on Debug and Release in x64 configuration  

    ### Ceres project
    
- Right click in okvis_ceres project > Properties > C/C++ > General > Additional Include Directories and add in Debug and Release configuration:
(CERES_SOLVER_DIR)/build/install/include
(OPENCV_DIR)/build/install/include

- Right click in okvis_ceres project > Properties > C/C++ > Preprocessor > Preprocessor Definitions and add 

        _USE_MATH_DEFINES 
        GLOG_NO_ABBREVIATED_SEVERITIES  
        NOMINMAX 

    in Debug and Release configuration

- In okvis_ceres project > External Dependencies> ode.hpp change all 

        __inline__ 

    to 
    
        inline
- Build okvis_ceres project on Debug and Release in x64 configuration 

    ### Timming project
    
- Right click in okvis_timing project > Properties > C/C++ > General > Additional Include Directories and add in Debug and Release configuration: 
    - (BOOST_DIR) 
- Right click in okvis_timing project > Properties > C/C++ > Preprocessor > Preprocessor Definitions and add 

        NOMINMAX 
    in Debug and Release configuration

- Build okvis_timing project on Debug and Release in x64 configuration 

    ### Frontend project

- Right click in okvis_frontend project > Properties > C/C++ > General > Additional Include Directories and add in Debug and Release configuration:
    - (CERES_SOLVER_DIR)/build/install/include;
    - (OPENCV_DIR)/build/install/include; 
    - (BOOST_DIR); 
    - (OKVIS_DIR)/build/brisk/src/brisk_external/include;
    - (OKVIS_DIR)/build/brisk/src/brisk_external/agast/include;
    - (OKVIS_DIR)/build/opengv/src/opengv/include

- Right click in okvis_frontend project > Properties > C/C++ > Preprocessor > Preprocessor Definitions and add 

        _USE_MATH_DEFINES 
        NOMINMAX 

    in Debug and Release configuration
    
    ### Multisensor Processing project
    
- Download pthreads-w32-2-9-1-release.zip from ftp://sourceware.org/pub/pthreads-win32/ and extract it    
- Right click in okvis_multisensor_processing project > Properties > C/C++ > General > Additional Include Directories and add in Debug and Release configuration:
    - (CERES_SOLVER_DIR)/build/install/include
    - (BOOST_DIR)
    - (PTHREAD_DIR)/include

- Right click in okvis_ multisensor_processing project > Properties > C/C++ > Preprocessor > Preprocessor Definitions and add 

        _USE_MATH_DEFINES
        NOMINMAX 
        HAVE_STRUCT_TIMESPEC 
        GLOG_NO_ABBREVIATED_SEVERITIES

    in Debug and Release configuration

- In (OKVIS_DIR)/okvis_multisensor_processing/include create an empty folder colled “sys” and into thais new folder, creat “time.h” and “times.h” files, which must contain, respectively: 

    ```c
    #pragma once
    #ifndef _TIMES_H
    #include "sys/times.h"
    #endif
    ```

    ```c
    #ifndef _TIMES_H
    #define _TIMES_H

    #ifdef _WIN32
    #include <sys/timeb.h>
    #include <sys/types.h>
    #include <windows.h>

    int gettimeofday(struct timeval* t,void* timezone);

    #define __need_clock_t
    #include <time.h>

    /* Structure describing CPU time used by a process and its children.  */
    struct tms
    {
        clock_t tms_utime;          /* User CPU time.  */
        clock_t tms_stime;          /* System CPU time.  */

        clock_t tms_cutime;         /* User CPU time of dead children.  */
        clock_t tms_cstime;         /* System CPU time of dead children.  */
    };

    clock_t times (struct tms *__buffer);
    typedef long long suseconds_t ;

    #endif
    #endif
    ```

- In (OKVIS_DIR)/okvis_multisensor_processing/src folder, add a time.cpp file, that must contain: 

    ```c
    #include "sys/times.h"

    int gettimeofday(struct timeval* t,void* timezone)
    {       struct _timeb timebuffer;
    _ftime( &timebuffer );
    t->tv_sec=timebuffer.time;
    t->tv_usec=1000*timebuffer.millitm;
    return 0;
    }

    clock_t times (struct tms *__buffer) {

    __buffer->tms_utime = clock();
    __buffer->tms_stime = 0;
    __buffer->tms_cstime = 0;
    __buffer->tms_cutime = 0;
    return __buffer->tms_utime;
    }
    ```

    And add it into okvis_multisensor_processing project > Source Files
    
- Build okvis_multisensor_processing project on Debug and Release in x64 configuration

    ### Okvis Apps Synchronous
    
- Right click in okvis_app_synchronous project > Properties > C/C++ > General > Additional Include Directories and add in Debug and Release configuration:
    - (CERES_SOLVER_DIR)/build/install/include;
    - (BOOST_DIR); 
    - (PTHREAD_DIR)/include
    - (OPENCV_DIR)/build/install/include

    
- Right click in okvis_app_synchronous project > Properties > C/C++ > Preprocessor > Preprocessor Definitions and add 

        _USE_MATH_DEFINES
        NOMINMAX 
        HAVE_STRUCT_TIMESPEC 
        GLOG_NO_ABBREVIATED_SEVERITIES
        WIN32_LEAN_AND_MEAN

    in Debug and Release configuration
    
- Right click in okvis_multisensor_processing project > Properties > Linker > Input > Additional Dependencies and remove 
    - lib\libbrisk.a 
    - lib\libagast.a 
    - lib\libceres.a 
    - gomp.lib 
    - lib\libopengv.a

    And add:
    - (OPENGV_DIR)/build/Release/opengv.lib
    - (CERES_SOLVER_DIR)/build/lib/Release/ceres.lib
    - (BRISK_DIR)/build/lib/Release/brisk.lib
    - (BOOST_DIR)/bin.v2/libs/date_time/build/msvc-14.1/release/address-model-64/link-static/threading-multi/libboost_date_time-vc141-mt-x64-1_68.lib
    - (PTHREAD_DIR)/lib/x64/pthreadVC2.lib

At the end of this, you must have the following libraries that are used in Okvis:

