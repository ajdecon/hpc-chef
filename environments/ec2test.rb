name "ec2"
description "An environment for testing the slurm cookbook on ec2"
override_attributes "slurm" => { 'master' => 'domU-12-31-39-00-A4-87', 'master_addr' => '10.254.171.117',
    'computes' => ['domU-12-31-39-16-C9-DB','domU-12-31-39-13-D5-27'], 'compute_addrs' => ['10.96.202.41', '10.201.214.213'],
    'cpus' => '1' }, "nfs" => { 'headnode_addr' => '10.254.171.117', 'shared_dirs' => ['/scratch'],
    'shared_perms' => ['0777','0755'],
    'clients' => ['10.96.202.41','10.201.214.213'] }
