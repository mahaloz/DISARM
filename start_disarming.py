#!/usr/bin/env python3
from pwn import *
from time import sleep 

if __name__ == '__main__':
    p = process('/usr/local/bin/mavproxy.py')
    # extremely hacky
    p.recvuntil('MAV>') 
    try: 
        for i in range(100):
            p.recv(1024)
            p.sendline('disarm')
            sleep(1) 
    except KeyboardInterrupt:
        print("[!] Interrupt Caught, ctrl-c to quit") 

