# This module defines

#=============================================================================
# Copyright 2003-2009 Kitware, Inc.
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

set(SDL2_MIXER_SEARCH_PATHS ${SDL2_MIXER_PATH})

FIND_PATH(SDL2_MIXER_INCLUDE_DIR SDL_MIXER.h
    HINTS
    $ENV{SDL2MIXERDIR}
    # SDLMIXERDIR is an environment variable that would correspond to the ./configure --prefix=$SDLMIXERDIR used in building SDL
    PATHS ${SDL2_MIXER_SEARCH_PATHS}
    PATH_SUFFIXES include
)

if (CMAKE_SIZEOF_VOID_P EQUAL 8) 
    set(PATH_SUFFIXES lib64 lib/x64 lib)
else() 
    set(PATH_SUFFIXES lib/x86 lib)
endif() 

find_library(SDL2_MIXER_LIBRARY
    NAMES SDL2_MIXER
    HINTS
    $ENV{SDL2MIXERDIR}
    PATHS ${SDL2_MIXER_SEARCH_PATHS}
    PATH_SUFFIXES ${PATH_SUFFIXES}
)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(SDL2_MIXER REQUIRED_VARS SDL2_MIXER_LIBRARY SDL2_MIXER_INCLUDE_DIR)