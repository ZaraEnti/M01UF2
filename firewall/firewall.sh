#!/bin/bash

#protocolo solo puede ejecutarlo nosotros
MYIP='10.65.0.44'

iptables -F

iptables -P INPUT DROP
iptables -P OUTPUT DROP

#pasar en mi maquina pues no quiero
iptables -P FORWARD DROP

iptables -A INPUT -p tcp --dport 22 -s $MYIP -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -d $MYIP -j ACCEPT



iptables -A INPUT -p tcp --dport 3333 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3333 -d 22 -j ACCEPT

