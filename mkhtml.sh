#!/usr/bin/bash
wget http://repo.continuum.io/miniconda/Miniconda-3.7.0-Linux-x86_64.sh -O miniconda.sh
bash ./miniconda.sh -b
export PATH=/home/travis/miniconda/bin:$PATH
conda update --yes conda
conda install --yes mkl

conda install --yes numpy scipy matplotlib scikit-learn sphinx

mkdir cache
pip install --download=cache/ scikit-learn
cd cache/
tar xf $(ls scikit-learn*.tar.gz)
cd scikit-learn*/doc/
make html && make optipng
cd ../..
