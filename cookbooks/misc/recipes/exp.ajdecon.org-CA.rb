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

cookbook_file "#{$cert_root}/#{$cert_name}" do
    source cert_name
    action :create
end

hash_val = `openssl x509 -noout -hash -in #{$cert_root}/#{$cert_name}`

link "#{$cert_root}/#{$hash_val}.0" do
    link_type :symbolic
    to "#{$cert_root}/#{$cert_name}"
end
