#
# Cookbook Name:: ajdecon.org
# Recipe:: exp.ajdecon.org-CA
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cert_root = "/etc/pki/tls/certs"
cert_name = "exp.ajdecon.org-CA.pem"
hash_val = "a4c1d59c"

package "openssl" do
    action :install
end

cookbook_file "#{cert_root}/#{cert_name}" do
    source cert_name
    action :create
end

link "#{cert_root}/#{hash_val}.0" do
    link_type :symbolic
    to "#{cert_root}/#{cert_name}"
end
