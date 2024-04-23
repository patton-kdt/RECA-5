## Kubernetes API server
iptables -A INPUT -p tcp -m tcp --dport 6443 -j ACCEPT
## etcd server client API
iptables -A INPUT -p tcp -m tcp --dport 2379:2380 -j ACCEPT
## Kubelet API
iptables -A INPUT -p tcp -m tcp --dport 10250 -j ACCEPT
## kube-controller-manager
iptables -A INPUT -p tcp -m tcp --dport 10257 -j ACCEPT
## kube-scheduler
iptables -A INPUT -p tcp -m tcp --dport 10259 -j ACCEPT
## ICMP - Ping 
iptables -A INPUT -p icmp  -j ACCEPT


## BGP
iptables -A INPUT -p tcp -m tcp --dport 179 -j ACCEPT
## VXLAN
iptables -A INPUT -p tcp -m tcp --dport 4789 -j ACCEPT

iptables-save > /etc/systemd/scripts/ip4save
