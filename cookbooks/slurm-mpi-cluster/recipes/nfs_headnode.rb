# Recipe for a cluster head node with an NFS share

package("nfs-common")
package("nfs-kernel-server")

template "/etc/exports" do
    source "exports.erb"
    owner "root"
    group "root"
    mode "0644"
end

service "nfs" do
    action [:enable,:start]
end

output = `exportfs -a`

