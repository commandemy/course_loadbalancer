#
# Cookbook Name:: course_loadbalancer
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

# 1 Install HAProxy package
apt_package "haproxy" do
  action :install
end

# Copy INIT script
template "/etc/default/haproxy" do
  source "haproxy.erb"
  action :create
end

# 2 Add nodes
servers = []

search(:node, "run_list:#{node['haproxy']['role']}").each do |n|
  servers << {name: n['fqdn'], ip: n['ipaddress']}
end

# Copy HAProxy config file
template "/etc/haproxy/haproxy.cfg" do
  source "haproxy.cfg.erb"
  action :create
  variables({
     :servers => servers
  })
end

# Start HAProxy
service "haproxy" do
  action :restart
end