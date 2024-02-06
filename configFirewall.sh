#!/bin/bash

W_IP="10.65.0.44"
ClIENT_IP="10.65.0.81"
MY_IP="10.65.0.32"

iptables -P input DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -A OUTPUT -p tcp --dport 22 -d $W_IP -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -s $W_IP -j ACCEPT

iptables -A INPUT -p tcp --dport 22 -s $MY_IP -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -d $MY_IP -j ACCEPT

iptables -A INPUT -p tcp --dport 3306 -s $CLIENT_IP -j ACCEPT
iptables -A OUTPUT -p tcp --dport 3306 -d $CLIENT_IP -j ACCEPT  
