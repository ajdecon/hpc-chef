# SLURM attributes
default['slurm']['master']         = "ip-10-120-177-89"
default['slurm']['master_addr']    = "107.22.142.122"
default['slurm']['computes']       = [ "ip-10-120-243-142", "domU-12-31-38-00-32-21" ]
default['slurm']['compute_addrs']  = [ "184.73.87.168", "50.17.71.36" ]
default['slurm']['part_name']      = "debug"
default['slurm']['user']           = "slurm"
default['slurm']['cpus']           = "1"

# MUNGE attributes
default['munge']['key']    = "nfusdnfjkaniuownfnljdnvcuowanrljvnjnvuoandfnsjanvuonejlnvjnuoannfdjslnvuaownljnfsdljvnsdualnfvjnafsuvnoweiunvlgrn"

# NFS share attributes
default['nfs']['headnode_addr']    = default['slurm']['master_addr']
default['nfs']['shared_dirs']      = ["/home"]
