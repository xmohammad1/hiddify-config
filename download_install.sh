wget https://raw.githubusercontent.com/hiddify/Hiddify-Manager/v10.5.73/common/google-bbr.sh
sysctl -w fs.file-max=51200
sysctl -w net.core.rmem_max=67108864
sysctl -w net.core.wmem_max=67108864
sysctl -w net.core.rmem_default=65536
sysctl -w net.core.wmem_default=65536
sysctl -w net.core.netdev_max_backlog=250000
sysctl -w net.core.somaxconn=4096
sysctl -w net.ipv4.tcp_syncookies=1
sysctl -w net.ipv4.tcp_tw_reuse=1
sysctl -w net.ipv4.tcp_fin_timeout=30
sysctl -w net.ipv4.tcp_keepalive_time=1200
sysctl -w net.ipv4.tcp_max_syn_backlog=8192
sysctl -w net.ipv4.tcp_max_tw_buckets=5000
sysctl -w net.ipv4.tcp_fastopen=3
sysctl -w net.ipv4.tcp_mem=24600 51200 102400
sysctl -w net.ipv4.tcp_rmem=4096 87380 67108864
sysctl -w net.ipv4.tcp_wmem=4096 65536 67108864
sysctl -w net.ipv4.tcp_mtu_probing=1
sysctl -w net.ipv4.ip_forward=1
sysctl -w net.netfilter.nf_conntrack_max=2097152
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_close_wait=60
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_fin_wait=60
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_time_wait=60
bash google-bbr.sh
