#! /bin/bash

cd ..
<<<<<<< HEAD
wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar -xf yasm-1.3.0.tar.gz 
cd yasm-1.3.0
./configure
make
sudo make install
cd ..
mkdir assembly
cd assembly
=======
wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz ; tar -xf yasm-1.3.0.tar.gz ; cd yasm-1.3.0;
./configure; 
make; 
sudo make install;
cd ..; mkdir assembly; cd assembly;
>>>>>>> FETCH_HEAD
cp ../asm_prog_ex/include/training.s training.s 
cp ../asm_prog_ex/include/test.asm test.asm 
