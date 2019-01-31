Okvis -> windows
1)	“time”: 
	a.	Time (dependência interna)
		i.	Em propriedades -> diretório de inclusão adc: okvis_time\include

2)	“ kinematics” : 
	a.	Gteste (dependencia externa)
		i.	em pré-processador _USE_MATH_DEFINES
		ii.	Em propriedades -> diretório de inclusão adc: include\gteste
		iii.	https://github.com/google/googletest

	b.	Eigen3 (dependencia externa)
		i.	modificação de __inline__ para inline
		ii.	Em propriedades -> diretório de inclusão adc: include\eigen
		iii.	http://eigen.tuxfamily.org/index.php?title=Main_Page

	c.	Kinematics (dependência interna)
		i.	Em propriedades -> diretório de inclusão adc: include\kinematics

3)	“util”
	a.	Util (dependência interna)
		i.	Em propriedades -> diretório de inclusão adc: include\util
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


- Set AMD_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/AMD and AMD_LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libamd.lib
- Set CAMD_INCLUDE_DIR to (SUITESPARSE)/SuiteSparse/CAMD and AMD_LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libcamd.lib
- Set CCOLAMD_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/CCOLAMD and CCOLAMD _LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libccolamd.lib
- Set COLAMD_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/COLAMD and COLAMD _LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libcolamd.lib
- Set CHOLMOD_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/CHOLMOD and CHOLMOD _LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libcholmod.lib
- Set SUITESPARSE_CONFIG_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/SuiteSparse_config and SUITESPARSE_CONFIG _LIBRARY to (SUITE_SPARSE_PATH)/build/Release/suitesparseconfig.lib
- Set SUITESPARSEQR_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/SPQR and SUITESPARSEQR _LIBRARY to (SUITE_SPARSE_PATH)/build/Release/libspqr.lib
- Set BRAS_bras _LIBRARY to (SUITE_SPARSE_PATH)/build/install/lib64/lapack_blas_windows/libblas.lib and click in “configure”


- Set LAPACK_lapack _LIBRARY to (SUITESPARSE)/build/install/lib64/lapack_blas_windows/liblapack.lib and click in “configure”
- Set CXSPARSE_INCLUDE_DIR to (SUITE_SPARSE_PATH)/SuiteSparse/CXSparse and CXSPARSE_LIBRARY to (SUITESPARSE)/build/Release/libcxsparse.lib and click in “configure”
- Set 	OpenCV_DIR to (OPENCV_PATH)/build and click in “configure"
 

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


```sh
cd dillinger
docker build -t joemccann/dillinger:${package.json.version} .
```
