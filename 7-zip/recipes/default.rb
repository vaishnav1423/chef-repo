#
# Cookbook:: 7-zip
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'p7zip' do
action :install
end


package 'p7zip-plugins' do
action :install
end
