#
# Cookbook Name:: ajdecon.org
# Recipe:: epel
#
# Install the EPEL repository (http://fedoraproject.org/wiki/EPEL) for EL 5 or EL 6
#

# Get EL version to determine which EPEL package to download
f = File.open("/etc/redhat-release","r")
el_version_string = f.gets
f.close

if (el_version_string =~ /6\.\d/) 
    epel_url = "http://mirrors.rit.edu/epel/6/i386/epel-release-6-7.noarch.rpm"
    dest_file = "/tmp/epel-release-6-7.noarch.rpm"
elsif (el_version_string =~ /5\.\d/)
    epel_url = "http://mirror.cogentco.com/pub/linux/epel/5/i386/epel-release-5-4.noarch.rpm"
    dest_file = "/tmp/epel-release-5-4.noarch.rpm"
else
    raise "Can't determine whether to use EPEL 5 or EPEL 6"
end

# Download EPEL repository to /tmp
remote_file dest_file do
    source epel_url
    mode "0644"
    action :create
end

# Install with yum
package "epel-release"
    action :install
    source dest_file
    provider Chef::Provider::Package::Rpm
end
