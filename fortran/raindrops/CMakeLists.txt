# Get the exercise name from the current directory
get_filename_component(exercise ${CMAKE_CURRENT_SOURCE_DIR} NAME)

# Basic CMake project
cmake_minimum_required(VERSION 3.0.0)

# Name the project after the exercise
project(${exercise} Fortran)

# set debug build default
set(CMAKE_BUILD_TYPE Debug)

# Get a source filename from the exercise name by replacing -'s with _'s
string(REPLACE "-" "_" file ${exercise})

# Activate Fortran compiler warnings
if(CMAKE_Fortran_COMPILER_ID MATCHES "Intel") # Intel fortran
  if(WIN32)
    set (CCMAKE_Fortran_FLAG ${CCMAKE_Fortran_FLAGS} "/warn:all")
  else()
    set (CMAKE_Fortran_FLAGS ${CCMAKE_Fortran_FLAGS} "-warn all")
  endif()
endif()
if(CMAKE_Fortran_COMPILER_ID MATCHES "GNU") # GFrotran
  set (CMAKE_Fortran_FLAGS ${CCMAKE_Fortran_FLAGS} "-std=f2008 -W -Wall -Wextra -pedantic -fbacktrace")
endif()

# Configure to run all the tests?
if(${EXERCISM_RUN_ALL_TESTS})
    add_definitions(-DEXERCISM_RUN_ALL_TESTS)
    set(exercise_f90 ${file}_build_all.f90)
else()
    # if building in exercise folder add testlib
    set(testlib_path ${CMAKE_CURRENT_SOURCE_DIR}/testlib)
    if (NOT EXISTS ${testlib_path})
      if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/../../../testlib) # in git repo locally?
        file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/../../../testlib DESTINATION  ${CMAKE_CURRENT_SOURCE_DIR} PATTERN *)
      else() # get from git with http
        message("Downloading testlib from https://raw.githubusercontent.com/exercism/fortran/master")
        file(MAKE_DIRECTORY ${testlib_path} )
        file(DOWNLOAD https://raw.githubusercontent.com/exercism/fortran/master/testlib/TesterMain.f90 ${testlib_path}/TesterMain.f90 SHOW_PROGRESS)
        file(DOWNLOAD https://raw.githubusercontent.com/exercism/fortran/master/testlib/CMakeLists.txt ${testlib_path}/CMakeLists.txt SHOW_PROGRESS)
      endif()
    endif()
    # add lib to build
    add_subdirectory(testlib)
    include_directories(testlib ${CMAKE_CURRENT_BINARY_DIR}/testlib)
    if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${file}.f90)
        set(exercise_f90 ${file}.f90)
    endif()
endif()

# Get test_files if exercise needs it
file(GLOB test_files test_files/*.*)
foreach(test_file ${test_files})
    message("Copying ${test_file} to binary directory for example ${file}")
    configure_file(${test_file} . COPYONLY)
endforeach()

# Build executable from sources and headers
add_executable(${exercise} ${exercise_f90} ${file}_test.f90  )

target_link_libraries(${exercise} TesterMain)

include(CTest)

add_test (${exercise}_test ${exercise} )

# Run the tests on every build
#add_custom_target(test_${exercise} ALL DEPENDS ${exercise} COMMAND ${exercise})

