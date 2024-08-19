# Add k8s repo
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key |
    gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" |
    tee /etc/apt/sources.list.d/kubernetes.list
# Add CRI-O repo
curl -fsSL https://pkgs.k8s.io/addons:/cri-o:/prerelease:/main/deb/Release.key |
    gpg --dearmor -o /etc/apt/keyrings/cri-o-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/cri-o-apt-keyring.gpg] https://pkgs.k8s.io/addons:/cri-o:/prerelease:/main/deb/ /" |
    tee /etc/apt/sources.list.d/cri-o.list

# Install k8s
apt-get install -y containerd kubelet kubeadm kubectl

modprobe br_netfilter
echo '1' > /proc/sys/net/ipv4/ip_forward
sudo sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
