# denyhosts/default.rb
#   Basic recipe for installing denyhosts on a server

package "denyhosts" do
    actioni[:install]
end

service "denyhosts" do 
    action[:enable,:start]
end
