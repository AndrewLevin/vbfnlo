imax=200
i=1

while((i<=imax)); do
    cat > jobs/job${i}.sh <<EOF
#!/bin/bash

echo $i

pwd

cd /afs/cern.ch/work/a/amlevin/vbfnlo/CMSSW_9_3_0/src/

eval \`scramv1 runtime -sh\`;

pwd

cd -

cp -r /afs/cern.ch/work/a/amlevin/vbfnlo/CMSSW_9_3_0/src/250/ 250

echo "SEED = $i" >& 250/random.dat

/afs/cern.ch/work/a/amlevin/vbfnlo/CMSSW_9_3_0/src/vbfnlo/bin/vbfnlo --input=./250/;

cp event.lhe /eos/user/y/yangli/andrew/data/lhe/vbfnlo-wpwp-2016/event.$i.lhe

EOF

i=$(($i+1))

done
