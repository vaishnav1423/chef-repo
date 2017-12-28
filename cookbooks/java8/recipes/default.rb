#
# Cookbook:: java8
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

$source_path=node['java8']['sourcepath']

rpm_package 'jdk' do
source $source_path
action :install
end


