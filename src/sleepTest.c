/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common.h"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv)
{
  char *sleepCountStr;
  int sleepCount;

  printArguments(argc, argv);
  sleepCountStr = getenv("TEST_SLEEP");
  if (!sleepCountStr) {
    sleepCount = 5;
  } else {
    sleepCount = atoi(sleepCountStr);
    if (sleepCount <= 0) {
      fprintf(stderr, "illegal sleepCount value: %d\n", sleepCount);
      exit(EXIT_FAILURE);
    }
  }
  sleep(sleepCount);
  return EXIT_SUCCESS;
}
