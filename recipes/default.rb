#
# Cookbook Name:: laravel-skeleton
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

service "httpd" do
  supports :status => true, :restart => true, :reload => true
end

execute "composer-install" do
  command "curl -sS https://getcomposer.org/installer | php ;mv composer.phar /usr/local/bin/composer"
  not_if { ::File.exists?("/usr/local/bin/composer")}
end

execute "laravel-install" do
  command "composer create-project laravel-ja/laravel /vagrant/#{node.app.project_name} --prefer-dist"
  not_if { ::File.exists?("/vagrant/#{node.app.project_name}")}
end

link "/var/www/#{node.app.project_name}" do
  to "/vagrant/#{node.app.project_name}"
end

directory "/vagrant/#{node.app.project_name}/app/storage" do
  mode 00777
  recursive true
end

template "/etc/httpd/sites-enabled/#{node.app.project_name}.conf" do
  source "sites-enabled.conf.erb"
  notifies :reload, "service[httpd]"
end

