#
# Cookbook Name:: chef-ampache
# Recipe:: apache
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

service node['chef-ampache']['service'] do
  supports status: true, reload: true, restart: true
  action [:enable]
end

template '/etc/apache2/sites-available/ampache' do
  source 'ampache.conf.erb'
  mode 755
  owner node['ampache']['user']
  group node['ampache']['group']
  notifies :restart, resources(service: 'apache2')
end
