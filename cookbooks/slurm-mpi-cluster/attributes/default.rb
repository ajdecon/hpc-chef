# SLURM attributes
default['slurm']['master']         = "ip-10-85-2-131"
default['slurm']['master_addr']    = "107.21.148.168"
default['slurm']['computes']       = [ "ip-10-144-65-60", "ip-10-36-79-48" ]
default['slurm']['compute_addrs']  = [ "107.22.142.152", "107.22.136.212" ]
default['slurm']['part_name']      = "debug"
default['slurm']['user']           = "slurm"
default['slurm']['cpus']           = "1"

# MUNGE attributes
default['munge']['key']    = "nfusdnfjkaniuownfnljdnvcuowanrljvnjnvuoandfnsjanvuonejlnvjnuoannfdjslnvuaownljnfsdljvnsdualnfvjnafsuvnoweiunvlgrn"

# NFS share attributes
default['nfs']['headnode_addr']    = default['slurm']['master_addr']
default['nfs']['shared_dirs']      = ["/scratch"]
default['nfs']['clients']          = default['slurm']['compute_addrs']
