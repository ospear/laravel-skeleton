#
# Cookbook Name:: site-cookbooks/mysql56
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql-server" do
  action :install
  options "--enablerepo=remi,remi-php55"
end

package "mysql-client" do
  action :install
  options "--enablerepo=remi,remi-php55"
end

