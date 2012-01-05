# Get data bag configuration
slurm = data_bag_item("slurm", "config")
mkey = data_bag_item("slurm","munge-key")

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
    variables(:key => mkey['key'])
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
    variables( 
        :master => slurm['master'], 
        :master_addr => slurm['master_addr'], 
        :computes => slurm['computes'].join(','), 
        :compute_addrs => slurm['compute_addrs'].join(','), 
        :part_name => slurm['part_name'], 
        :cpus => slurm['cpus'] 
    )
end

service "slurm-llnl" do
    action [:enable,:start]
end
