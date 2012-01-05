# Apply this recipe to compute nodes which will mount 
# one or more NFS shares (i.e. /home or /scratch) from
# the cluster head node. 

# Note : this does not use a template, but instead adds 
# a line to the existing fstab!

package("nfs-common")

file "/etc/fstab" do

    sourceip = node.nfs['headnode_addr']
    dirs = node.nfs['shared_dirs']

    # Generate the new fstab lines
    new_lines = ""
    dirs.each do |d| 
        new_lines = new_lines + "#{sourceip}:#{d}  #{d}  nfs  defaults 0 0\n"
    end

    # Get current content, check for duplication
    only_if do
        current_content = File.read('/etc/fstab')
        current_content.index(new_lines).nil?
    end

    # Set up the new file and content
    owner "root"
    group "root"
    mode  "0644"
    content do 
        current_content = File.read('/etc/fstab')
        current_content + new_lines
    end

    # Trigger the mount
    output = `mount -a`
end
