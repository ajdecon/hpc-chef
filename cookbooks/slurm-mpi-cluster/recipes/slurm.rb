# Install packages
%w{munge slurm-llnl slurm-llnl-torque slurm-llnl-basic-plugins slurm-llnl-basic-plugins-dev}.each do |pkg|
    package pkg do
        action [:install]
    end
end

# munge configuration
directory "/etc/munge" do
    action :create
end

directory "/etc" do
    mode "0755"
end

user("munge")

template "/etc/munge/munge.key" do
    source "munge.key.erb"
    owner "munge"
end

service "munge" do
    action [:enable,:start]
end

# slurm configuration
user(slurm['user'])

directory "/etc/slurm-llnl" do 
    owner "root"
    group "root"
    mode "0755"
    action :create
end

template "/etc/slurm-llnl/slurm.conf" do
    source "slurm.conf.erb"
    owner "slurm"
    mode "0755"
end

service "slurm-llnl" do
    action [:enable,:start]
end
