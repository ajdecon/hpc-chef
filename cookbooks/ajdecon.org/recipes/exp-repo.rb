# Add exp.ajdecon.org repository to yum repos
# Assumes EL 6.x or 5.x.

# Get EL version to determine which version to use
f = File.open("/etc/redhat-release","r")
el_version_string = f.gets
f.close

if (el_version_string =~ /6\.\d/) 
    repo_file = "exp-el6.repo"
elsif (el_version_string =~ /5\.\d/)
    repo_file = "exp-el5.repo"
else
    raise "Can't determine whether to use EPEL 5 or EPEL 6"
end

cookbook_file "#{repo_file}" do
    source "#{repo_file}"
    path "/etc/yum.repos.d/#{repo_file}"
    mode "0644"
    owner "root"
    group "root"
end
