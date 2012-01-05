#
# Cookbook Name:: ajdecon-settings
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user "ajdecon" do
    username "ajdecon"
    shell "bash"
    action [:create]
    home "/home/ajdecon"
    supports { :manage_home => true }
end

cookbook_file "/home/ajdecon/.ssh/authorized_keys" do
    source "authorized_keys"
    owner "ajdecon"
    mode "0600"
    action :create
end

cookbook_file "/home/ajdecon/.vimrc" do
    source "vimrc"
    owner "ajdecon"
    mode "0600"
    action :create
end

cookbook_file "/home/ajdecon/.screenrc" do
    source "screenrc"
    owner "ajdecon"
    mode "0600"
    action :create
end

%w{ }.each do |pkg|
    package pkg do
        action :install
    end
end
