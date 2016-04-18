# vm-zk03


## DEBIAN (tested 8.3)

### First init (on clean VM)
```
sudo apt-get -y install git && git clone git://github.com/everteam/vm-zk03.git ZK && bash ./ZK/boot.sh
```

### Force init (on previously installed VM)
```
sudo rm -rf $(readlink -f /everteam) && sudo rm -rf /everteam && cd && rm -rf * && git clone git://github.com/everteam/vm-zk03.git ZK && bash ./ZK/boot.sh
```

## CENTOS (tested 6.7 7.2)

### First init (on clean VM)
```
sudo yum -y install git && git clone git://github.com/everteam/vm-zk03.git ZK && bash ./ZK/boot.sh
```

### Force init (on previously installed VM)
```
sudo rm -rf $(readlink -f /everteam) && sudo rm -rf /everteam && cd && rm -rf * && git clone git://github.com/everteam/vm-zk03.git ZK && bash ./ZK/boot.sh
```
