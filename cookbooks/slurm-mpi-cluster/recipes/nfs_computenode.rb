# Apply this recipe to compute nodes which will mount 
# one or more NFS shares (i.e. /home or /scratch) from
# the cluster head node. 

# Note : this does not use a template, but instead adds 
# a line to the existing fstab!

package("nfs-common")

# Make sure the diretory to be exported exists
node.nfs['shared_dirs'].each do |dir|
    directory dir do
        mode "0777"
        action :create
    end
end


file "/etc/fstab" do

    sourceip = node.nfs['headnode_addr']
    dirs = node.nfs['shared_dirs']

    # Generate the new fstab lines
    new_lines = ""
    dirs.each do |d| 
        new_lines = new_lines + "#{sourceip}:#{d}  #{d}  nfs  defaults 0 0\n"
    end

    print "*** Mount line: #{new_lines}\n"

    # Get current content, check for duplication
    only_if do
        current_content = File.read('/etc/fstab')
        current_content.index(new_lines).nil?
    end

    print "*** Passed the conditional for current content\n"

    # Set up the file and content
    owner "root"
    group "root"
    mode  "0644"
    current_content = File.read('/etc/fstab')
    new_content = current_content + new_lines
    content new_content

end

execute "mount" do
    command "mount -a"
    action :run
end
