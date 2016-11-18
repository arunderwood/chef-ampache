#
# Cookbook Name:: chef-ampache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'chef-ampache::apache'
include_recipe 'chef-ampache::mysql'
include_recipe 'chef-ampache::ampache'
