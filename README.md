# VM.ZK03

sudo apt-get -y install git && git clone git://github.com/everteam/VM.ZK03.git ZK && bash ./ZK/boot.sh



if [ -d \"$(readlink -f /everteam)\" ]; then ./boot.sh ; else sudo apt-get -y install git 
&& git clone git://github.com/everteam/VM.ZK03.git ZK && bash ./ZK/boot.sh; fi

