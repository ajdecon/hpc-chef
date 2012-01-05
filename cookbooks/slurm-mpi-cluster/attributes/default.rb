# SLURM attributes
default['slurm']['master']         = "ip-10-124-89-180"
default['slurm']['master_addr']    = "67.202.52.146"
default['slurm']['computes']       = [ "domU-12-31-38-00-6D-C2" ]
default['slurm']['compute_addrs']  = [ "67.202.29.115" ]
default['slurm']['part_name']      = "debug"
default['slurm']['user']           = "slurm"
default['slurm']['cpus']           = "1"

# MUNGE attributes
default['munge']['key']    = "nfusdnfjkaniuownfnljdnvcuowanrljvnjnvuoandfnsjanvuonejlnvjnuoannfdjslnvuaownljnfsdljvnsdualnfvjnafsuvnoweiunvlgrn"

# NFS share attributes
default['nfs']['headnode_addr']    = default['slurm']['master_addr']
default['nfs']['shared_dirs']      = ["/home"]
default['nfs']['clients']          = default['slurm']['compute_addrs']
