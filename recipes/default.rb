#
# Cookbook Name:: course_loadbalancer
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_package "haproxy" do
  action :install # see actions section below
end

# Copy INIT script
template "/etc/default/haproxy" do
  source "haproxy.erb"
  action :create
end

# Search Nodes (now still using variables)
servers = []

#search(:node, "roles:#{node['haproxy']['role']}").each do |n|
#  servers << {name: n['fqdn'], ip: n['ipaddress']}
#end

node['haproxy']['nodes'].each do |n|
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
execute "service haproxy restart" do
  action :run
end