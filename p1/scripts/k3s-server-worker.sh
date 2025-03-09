# Update packages
apt-get update -y
apt-get upgrade -y

# Install curl
apt install curl -y

# Add knowlage to join cluster to be Agent or Worker
export K3S_TOKEN_FILE="/vagrant/scripts/cluster-token"
export K3S_URL="https://192.168.56.110:6443"
export INSTALL_K3S_EXEC="--node-ip=192.168.56.111"

# Set up k3s cluster
curl -sfL https://get.k3s.io | sh -

# Add label
kubectl label nodes ayumusaksw node-role.kubernetes.io/worker=worker

# We don't need the token. We can delete
rm /vagrant/scripts/cluster-token
