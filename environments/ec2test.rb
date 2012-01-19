name "ec2slurm-test"
description "An environment for testing the slurm cookbook on ec2"
override_attributes "slurm" => { 'master' => 'slmaster', 'master_addr' => '10.0.0.1',
    'computes' => ['node01','node02'], 'compute_addrs' => ['10.0.1.1', '10.0.1.2'],
    'cpus' => '8' }, "nfs" => { 'headnode_addr' => '10.0.0.1', 'shared_dirs' => ['/scratch','/test'],
    'shared_perms' => ['0777','0755'],
    'clients' => ['10.0.1.1','10.0.1.2'] }
