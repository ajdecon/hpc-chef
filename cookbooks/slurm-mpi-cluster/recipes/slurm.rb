slurm = data_bag_item("slurm", "config")

%w{munge slurm-llnl slurm-llnl-torque slurm-llnl-basic-plugins slurm-llnl-basic-plugins-dev}.each do |pkg|
    package pkg do
        action [:install]
    end
end

user(slurm['user'])

template "/etc/slurm/slurm.conf" do
    source "slurm.conf.erb"
    variables( :slurm_master => slurm['master'], :slurm_computes => slurm['computes'], :part_name => slurm['part_name'] )
end

service "slurm" do
    action [:enable,:start]
end
