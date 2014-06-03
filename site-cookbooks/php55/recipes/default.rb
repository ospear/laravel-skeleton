#
# Cookbook Name:: php55
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{php php-pear php-mbstring php-devel php-gd php-mysql php-pecl-apc php-pecl-zendopcache}.each do |pkg|
  package pkg do
    options "--enablerepo=remi,remi-php55"
    action :install
  end
end

