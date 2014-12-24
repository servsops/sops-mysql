#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql::_server"

include_recipe "mysql::_client"
