# Update packages
apt-get update -y
apt-get upgrade -y

# Install curl
apt install curl -y

# Write kubeconfig with this mode.
export K3S_KUBECONFIG_MODE=644

export INSTALL_K3S_EXEC="--node-ip=192.168.56.110"

# Set up k3s cluster and join cluster to be Agent or Worker
curl -sfL https://get.k3s.io | sh -

# Copy the token so that it can be used to join the cluster, and send the mounted folder
cat /var/lib/rancher/k3s/server/node-token > /vagrant/scripts/cluster-token
