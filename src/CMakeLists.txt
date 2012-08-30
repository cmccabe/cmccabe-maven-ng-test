#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cmake_minimum_required(VERSION 2.6 FATAL_ERROR)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -Wall -O2")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_REENTRANT -D_FILE_OFFSET_BITS=64")

message("WATERMELON TEST_CMAKE_VAR = ${TEST_CMAKE_VAR}")

if(FAIL_THE_BUILD)
    message(FATAL_ERROR "Failing the build because FAIL_THE_BUILD was set!")
endif()

if("${TEST_CMAKE_VAR}" STREQUAL "FOOBAZ")
else()
  message(FATAL_ERROR "Must set TEST_CMAKE_VAR to FOOBAZ")
endif()

if("$ENV{TEST_ENV_VAR}" STREQUAL "FOOBAR")
else()
  message(FATAL_ERROR "Must set TEST_ENV_VAR to FOOBAR")
endif()

add_executable(passingTest passingTest.c common.c)
add_executable(sleepTest sleepTest.c common.c)
add_executable(returnTest returnTest.c common.c)
