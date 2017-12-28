#
# Cookbook:: yum_nw
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "httpd"

service "httpd" do
action :enable
end

service "httpd" do
action :start
end

package "createrepo" do 
action :install
end

repo_path = "#{node['yum_repo']['package_dir']}"

directory "#{repo_path}" do
action :create
end

execute "createrepo #{repo_path}" do
command <<-EOF
	createrepo #{repo_path}
EOF
end
