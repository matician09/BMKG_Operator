# Spack setting and Compilers installation

## Cloning Spack
"""
git clone --depth=2 --branch=releases/v0.23 https://github.com/spack/spack.git  ~/spack
"""

## Source the environment of spack
"""
cd spack
source ~/spack/share/spack/setup-env.sh
"""

## Install lmod
"""
spack install lmod
source $(spack location -i lmod)/lmod/lmod/init/bash
"""

## Install AOCC
"""
spack install aocc +license-agreed
spack compiler find
spack compiler list
spack module lmod refresh --delete-tree -y
module use ~/spack/share/spack/lmod/linux*/Core
module avail aocc
"""

## Install intel oneAPI
"""
spack install intel-oneapi-compilers
spack compiler add $(spack location -i intel-oneapi-compilers)/compiler/latest/bin
spack module lmod refresh --delete-tree -y
module use ~/spack/share/spack/lmod/linux*/Core
module avail intel
"""

## Install GCC
"""
spack install gcc
pack compiler add $(spack location -i gcc)/bin
spack module lmod refresh --delete-tree -y
module use ~/spack/share/spack/lmod/linux*/Core
module avail intel
"""

## env.sh
"""
source ~/spack/share/spack/setup-env.sh
source $(spack location -i lmod)/lmod/lmod/init/bash
module use ${SPACK_ROOT}/share/spack/lmod/linux-ubuntu22.04-x86_64/Core
# linux-ubuntu* : It may need to be changed depending on your environment.
"""
