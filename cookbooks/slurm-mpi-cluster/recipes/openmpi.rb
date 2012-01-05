%w{openmpi-common openmpi-bin openmpi-checkpoint libopenmpi-dev openmpi-doc}.each do |pkg|
    package pkg do
        action [:install]
    end
end
