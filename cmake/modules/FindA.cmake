include(FindPackageHandleStandardArgs)

# Handle A1 component

set(_A_ROOT_HINTS
    ${A_ROOT_DIR}
    ENV A_ROOT_DIR)

set(_A_ROOT_PATHS)

set(_A_ROOT_HINTS_AND_PATHS
    HINTS ${_A_ROOT_HINTS}
    PATHs ${_A_ROOT_PATHS})

find_path(A_A1_INCLUDE_DIR
    NAMES a1/a1.h
    ${_A_ROOT_HINTS_PATHS}
    PATH_SUFFIXES include)

find_library(A_A1_LIBRARY
    NAMES libA1 A1
    NAMES_PER_DIR
    ${_A_ROOT_HINTS_PATHS}
    PATH_SUFFIXES lib)

if(A_A1_INCLUDE_DIR AND A_A1_LIBRARY)
    set(A_A1_FOUND TRUE)
endif()

# Handle A2 component

find_path(A_A2_INCLUDE_DIR
    NAMES a2/a2.h
    ${_A_ROOT_HINTS_PATHS}
    PATH_SUFFIXES include)

find_library(A_A2_LIBRARY
    NAMES libA2 A2
    NAMES_PER_DIR
    ${_A_ROOT_HINTS_PATHS}
    PATH_SUFFIXES lib)

if(A_A2_INCLUDE_DIR AND A_A2_LIBRARY)
    set(A_A2_FOUND FOUND)
endif()

# Handle components

if(A_FIND_COMPONENTS)
    set(_A_COMPONENTS ${A_FIND_COMPONENTS})
else()
    set(_A_COMPONENTS "A1" "A2")
endif()

set(A_INCLUDE_DIRS)
set(A_LIBRARIES)
foreach(_COMP IN LISTS _A_COMPONENTS)
    if(A_${_COMP}_FOUND)
        list(APPEND A_INCLUDE_DIRS ${A_${_COMP}_INCLUDE_DIR})
        list(APPEND A_LIBRARIES ${A_${_COMP}_LIBRARY})
    endif()
endforeach()
list(REMOVE_DUPLICATES A_INCLUDE_DIRS)
list(REMOVE_DUPLICATES A_LIBRARIES)

mark_as_advanced(
    A_INCLUDE_DIRS A_A1_INCLUDE_DIR A_A2_INCLUDE_DIR
    A_LIBRARIES A_A1_LIBRARY A_A2_LIBRARY)

find_package_handle_standard_args(A
    REQUIRED_VARS
        A_A1_LIBRARY
        A_A1_INCLUDE_DIR
    HANDLE_COMPONENTS)

if(A_FOUND)
    # Set A::A1
    if(NOT TARGET A::A1 AND EXISTS "${A_A1_LIBRARY}")
        add_library(A::A1 UNKNOWN IMPORTED)
        set_target_properties(A::A1
            PROPERTIES
                INTERFACE_INCLUDE_DIRECTORIES "${A_A1_INCLUDE_DIR}"
                IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
                IMPORTED_LOCATIONS "${A_A1_LIBRARY}")
    endif()

    # Set A::A2
    if(NOT TARGET A::A2 AND EXISTS "${A_A2_LIBRARY}")
        add_library(A::A2 UNKNOWN IMPORTED)
        set_target_properties(A::A2
            PROPERTIES
                INTERFACE_INCLUDE_DIRECTORIES "${A_A2_INCLUDE_DIR}"
                IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
                IMPORTED_LOCATIONS "${A_A2_LIBRARY}"
                INTERFACE_LINK_LIBRARIES A::A1)
    endif()
endif()
