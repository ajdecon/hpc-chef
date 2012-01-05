#
# Cookbook Name:: cheftest
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/tmp/default.txt" do
    source "default.txt"
    mode 0755
    owner "ajdecon"
    group "admin"
end
