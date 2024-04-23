## Kubelet API
iptables -A INPUT -p tcp -m tcp --dport 10250 -j ACCEPT
## kube-proxy
iptables -A INPUT -p tcp -m tcp --dport 10256 -j ACCEPT
## NodePort Services
iptables -A INPUT -p tcp -m tcp --dport 30000:32767 -j ACCEPT

## ICMP - Ping 
iptables -A INPUT -p icmp  -j ACCEPT

## BGP
iptables -A INPUT -p tcp -m tcp --dport 179 -j ACCEPT
## VXLAN
iptables -A INPUT -p tcp -m tcp --dport 4789 -j ACCEPT

iptables-save > /etc/systemd/scripts/ip4save
