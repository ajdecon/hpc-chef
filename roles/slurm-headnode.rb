name "slurm-headnode"
description "SLURM cluster headnode"
run_list(
    "recipe[slurm-mpi-cluster::slurm]",
    "recipe[slurm-mpi-cluster::nfs_headnode]",
    "recipe[slurm-mpi-cluster::openmpi]",
    "recipe[slurm-mpi-cluster::pdsh]"
)
