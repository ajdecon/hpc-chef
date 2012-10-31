cookbook_file "/tmp/helloworld" do
    source "goodbye"
    action :create
end
