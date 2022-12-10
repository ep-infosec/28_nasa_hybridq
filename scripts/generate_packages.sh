#!/bin/bash

# Author: Salvatore Mandra (salvatore.mandra@nasa.gov)
#
# Copyright © 2021, United States Government, as represented by the Administrator
# of the National Aeronautics and Space Administration. All rights reserved.
#
# The HybridQ: A Hybrid Simulator for Quantum Circuits platform is licensed under
# the Apache License, Version 2.0 (the "License"); you may not use this file
# except in compliance with the License. You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0.
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

DOCKER=${DOCKER:-docker}
COMPOSER=${COMPOSER:-${DOCKER}-compose}

# Create and copy packages
true && \
  ${COMPOSER} -f packages/docker-compose.yml build
  ${DOCKER} run --rm -v $(pwd)/packages:/packages hybridq-manylinux2010_x86_64 bash -c 'cp /hybridq*.whl /packages' && \
  ${DOCKER} run --rm -v $(pwd)/packages:/packages hybridq-manylinux2014_x86_64 bash -c 'cp /hybridq*.whl /packages'
