name "slurm-computenode"
description "SLURM cluster compute node"
run_list(
    "recipe[slurm-mpi-cluster::slurm]",
    "recipe[slurm-mpi-cluster::nfs_computenode]",
    "recipe[slurm-mpi-cluster::openmpi]"
)
