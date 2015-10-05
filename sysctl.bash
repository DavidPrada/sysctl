#!/bin/bash
#
# Sysctl configuration
#
echo '
# Avoid a smurf attack
net.ipv4.icmp_echo_ignore_broadcasts = 1
 
# Turn on protection for bad icmp error messages
net.ipv4.icmp_ignore_bogus_error_responses = 1
 
# Turn on syncookies for SYN flood attack protection
net.ipv4.tcp_syncookies = 1
 
# Turn on and log spoofed, source routed, and redirect packets
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
 
# No source routed packets here
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
 
# Turn on reverse path filtering
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
 
# Make sure no one can alter the routing tables
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
 
# Dont act as a router
net.ipv4.ip_forward = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0

# Increase Linux auto tuning TCP buffer limits
# min, default, and max number of bytes to use
# set max to at least 4MB, or higher if you use very high BDP paths
# Tcp Windows etc
net.core.netdev_max_backlog = 5000
net.ipv4.tcp_window_scaling = 1

# Tune IPv6
# net.ipv6.conf.default.router_solicitations = 0
# net.ipv6.conf.default.accept_ra_rtr_pref = 0
# net.ipv6.conf.default.accept_ra_pinfo = 0
# net.ipv6.conf.default.accept_ra_defrtr = 0
# net.ipv6.conf.default.autoconf = 0
# net.ipv6.conf.default.dad_transmits = 0
# net.ipv6.conf.default.max_addresses = 1

# Disable IPv6
net.ipv6.conf.all.disable_ipv6=1
' | sudo tee /etc/sysctl.conf && sudo sysctl -p
