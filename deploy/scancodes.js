#!/usr/bin/env node

var str = 'sudo rm -rf $(readlink -f /everteam) && sudo rm -rf /everteam && cd && rm -rf * && git clone git://github.com/everteam/vm-zk03.git ZK && bash ./ZK/boot.sh'

var s=""
for (var i = 0, len = str.length; i < len; i++) {
    if(i%15 == 0) {
        s = s + '\n"C:\\Program Files\\Oracle\\VirtualBox\\VBoxManage.exe" controlvm vm-zk03-et522-solr-postgres-POC_MAIF_CA keyboardputscancode'
    }
  s = s + " " +  convert(str[i])
}
  console.log(s + ' 1c 9c')

function convert(c) {
       
       
       var tab = {'s': '1f 9f', 
                  'u': '16 96',
                  'd': '20 a0',
                  'o': '18 98',
                  ' ': '39 b9',
                  'r': '13 93',
                  'm': '27 a7',
                  '-': '07 87',
                  'e': '12 92',
                  'a': '10 90',
                  'l': '26 a6',
                  'i': '17 97',
                  'n': '31 b1',
                  'k': '25 a5',
                  '$': '1b 9b',
                  '(': '06 86',
                  ')': '0c 8c',
                  '/': '36 34 b4 b6',
                  '*': '2b ab',
                  'v': '2f af',
                  'f': '21 a1',
                  'c': '2e ae',
                  'g': '22 a2',
                  'i': '17 97',
                  't': '14 94',
                  '0': '36 0b 8b b6',
                  '3': '36 04 84 b6',
                  'Z': '36 11 91 b6',
                  'K': '36 25 a5 b6',
                  ':': '34 b4',
                  'b': '30 b0',
                  'h': '23 a3',
                  '.': '36 33 b3 b6',
                  '&': '02 82',
                  'z': '11 91',
                  }
       if(!tab[c])
        return c + ' not found'
       return tab[c]
       
}

