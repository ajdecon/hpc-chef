# Install packages
%w{munge slurm-llnl slurm-llnl-torque slurm-llnl-basic-plugins slurm-llnl-basic-plugins-dev}.each do |pkg|
    package pkg do
        action [:install]
    end
end

# Munge is used by SLURM for authentication, and requires a few 
# pre-conditions.

# Make sure /etc/munge directory exists
directory "/etc/munge" do
    action :create
end

# Make /etc have suitable permissions
directory "/etc" do
    mode "0755"
end

# Make sure the munge user exists
user("munge")

# Create the munge key from template
template "/etc/munge/munge.key" do
    source "munge.key.erb"
    owner "munge"
end

# Enable and start the munge service
service "munge" do
    action [:enable,:start]
end

# SLURM configuration

# Create the slurm user based on settings
user(node.slurm['user'])

# Make sure the config directory exists
directory "/etc/slurm-llnl" do 
    owner "root"
    group "root"
    mode "0755"
    action :create
end

# Build slurm.conf based on the template
template "/etc/slurm-llnl/slurm.conf" do
    source "slurm.conf.erb"
    owner "slurm"
    mode "0755"
end

# Enable and start the slurm service
service "slurm-llnl" do
    action [:enable,:start]
end
