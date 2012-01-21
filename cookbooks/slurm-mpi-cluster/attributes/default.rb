# SLURM attributes
default['slurm']['master']         = "slmaster"
default['slurm']['master_addr']    = "10.0.0.1"
default['slurm']['computes']       = [ "compute1", "compute2" ]
default['slurm']['compute_addrs']  = [ "10.0.1.1", "10.0.1.2" ]
default['slurm']['part_name']      = "production"
default['slurm']['user']           = "slurm"
default['slurm']['cpus']           = "1"

# MUNGE attributes
default['munge']['key']    = "RandomKeyGoesHereRandomKeyGoesHereRandomKeyGoesHereRandomKeyGoesHere"

# NFS share attributes
default['nfs']['headnode_addr']    = default['slurm']['master_addr']
default['nfs']['shared_dirs']      = ["/scratch"]
default['nfs']['clients']          = default['slurm']['compute_addrs']
