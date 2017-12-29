#
# Cookbook:: yum_nw
# Recipe:: default
# Author:: Vaishnav Kedar
# Copyright:: 2017, The Authors, All Rights Reserved.
#
#

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

repo_path = "#{node['yum_nw']['repo_path']}"
remote_url = "#{node['yum_nw']['remote_url']}"

directory "#{repo_path}" do
	action :create
end

execute "createrepo" do
	command <<-EOF
	       createrepo #{repo_path}
	EOF
	action :nothing
end


file "#{repo_path}/flag" do
	mode '0755'
	action :create_if_missing
	notifies :run,'execute[createrepo]',:immediately
end

execute "Sync Network repo" do
	command <<-EOF
		rsync -avz #{remote_url} #{repo_path}
	EOF
	action :run
end
