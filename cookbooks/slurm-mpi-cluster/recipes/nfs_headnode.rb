# Recipe for a cluster head node with an NFS share

# Install NFS packages
package("nfs-common")
package("nfs-kernel-server")

# Start the NFS server
service "nfs-kernel-server" do
    action [:enable,:start]
end


# Make sure the diretory to be exported exists
node.nfs['shared_dirs'].each do |dir|
    directory dir
        action :create
    end
end

# Create the exports file and refresh the NFS exports
template "/etc/exports" do
    source "exports.erb"
    owner "root"
    group "root"
    mode "0644"

    output = `exportfs -ra`
    puts output
end


