scram p CMSSW CMSSW_9_3_0
cd CMSSW_9_3_0/src/
tar -xvf /afs/cern.ch/user/a/amlevin/Downloads/vbfnlo-2.7.1.tgz 
mkdir vbfnlo
cd VBFNLO-2.7.1
#in the file utilities/leshouches.F, change the line " 5100 format(1p,2i8,2e14.6,6i6)" to " 5100 format(1p,2i8,2e14.6,6i7)"
#this is necessary because the LHAPDF PDF numbers are 6 digits long
./configure --prefix=/afs/cern.ch/work/a/amlevin/vbfnlo/CMSSW_9_3_0/src/vbfnlo/ --with-LHAPDF=/cvmfs/cms.cern.ch/slc6_amd64_gcc630/external/lhapdf/6.2.1/
make && make install
cd ../
mkdir 250
cp -r vbfnlo/share/VBFNLO/* 250/
mkdir 260
cp -r vbfnlo/share/VBFNLO/* 260/
#need to change the file
#date; vbfnlo/bin/vbfnlo --input=/afs/cern.ch/work/a/amlevin/vbfnlo/CMSSW_9_3_0/src/250/; date;
#date; vbfnlo/bin/vbfnlo --input=/afs/cern.ch/work/a/amlevin/vbfnlo/CMSSW_9_3_0/src/260/; date;