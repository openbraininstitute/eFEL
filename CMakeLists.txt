# Copyright (c) 2015, EPFL/Blue Brain Project                                   
# Copyright (c) 2025-2026 Open Brain Institute
#                                                                                
# This file is part of eFEL <https://github.com/BlueBrain/eFEL>                 
#                                                                               
# This library is free software; you can redistribute it and/or modify it under 
# the terms of the GNU Lesser General Public License version 3.0 as published   
# by the Free Software Foundation.                                              
#                                                                               
# This library is distributed in the hope that it will be useful, but WITHOUT   
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS 
# FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more 
# details.                                                                      
#                                                                               
# You should have received a copy of the GNU Lesser General Public License      
# along with this library; if not, write to the Free Software Foundation, Inc., 
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.                              

cmake_minimum_required(VERSION 3.12)
project("efel")

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake)  

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -w")

exec_program(                                                                   
    "git"                                                                       
    ${CMAKE_CURRENT_SOURCE_DIR}                                                 
    ARGS "describe --tags --abbrev=0 --always"                                  
    OUTPUT_VARIABLE EFEL_MAINVERSION)                             
                                                                                
exec_program(                                                                   
    "git"                                                                       
    ${CMAKE_CURRENT_SOURCE_DIR}                                                 
    ARGS "describe --tags --abbrev=4 --dirty --always"                          
    OUTPUT_VARIABLE EFEL_VERSION)                                 
                                                                                
message("Working with efel version: ${EFEL_VERSION} (Main version: ${EFEL_MAINVERSION})")

add_subdirectory("efel")
