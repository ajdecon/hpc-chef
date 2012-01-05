cookbook_file "/tmp/tmpfile.txt" do 
    source "tmpfile.txt"
    mode 0755
    owner "root"
    group "root"
end
