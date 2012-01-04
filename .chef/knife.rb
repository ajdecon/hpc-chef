current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                'ajdecon-exp'
client_key               '/home/ajdecon/.chef/ajdecon-exp.pem'
validation_client_name   'chef-validator'
validation_key           '/etc/chef/validation.pem'
chef_server_url          'http://util.ajdecon.org:4000'
cache_type               'BasicFile'
cache_options( :path => '/home/ajdecon/.chef/checksums' )
cookbook_path            ["#{current_dir}/../cookbooks"]
