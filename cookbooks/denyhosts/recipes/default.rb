#
# Cookbook Name:: denyhosts
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "denyhosts" do
    action [:install]
end

template "/etc/denyhosts.conf" do
    source "denyhosts.conf.erb"
    variables( :deny_purge => "5d", :deny_service => "sshd")
end

service "denyhosts" do 
    action [:enable,:start]
end
