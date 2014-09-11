#
# Cookbook Name:: course_loadbalancer
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

#ode.default['haproxy']['incoming_address'] = 0.0.0.1
#ode.default['haproxy']['incoming_port'] = 80
#ode.default['haproxy']['members'] =

node.default['haproxy']['httpchk'] = true
node.default['haproxy']['x_forwarded_for'] = true
node.default['haproxy']['app_server_role'] = "app_server"

include_recipe "haproxy::app_lb"