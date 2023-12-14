#!/bin/bash

#protocolo solo puede ejecutarlo nosotros


iptables -F

iptables -P INPUT DROP
iptables -P OUTPUT DROP

iptables -A INPUT -p tcp --sport 22 -s 10.65.0.44 ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -d 10.65.0.44 ACCEPT

iptables -A INPUT -p tcp --sport 3333 -s 10.65.0.44 ACCEPT
iptables -A OUTPUT -p tcp --dport 333333 -d 10.65.0.44 ACCEPT
