# Garantindo as chaves
ssh-keygen -q -t rsa -f key -N ''

KEY_PATH='/vagrant/files'
mkdir -p /root/.ssh
cp $KEY_PATH/key /root/.ssh/id_rsa
cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >>/home/vagrant/.ssh/authorized_keys

# Garantindo os hosts
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" >/etc/hosts
echo '10.20.20.100 master.linuxtips' >>/etc/hosts
echo '10.20.20.110 node01.linuxtips' >>/etc/hosts
echo '10.20.20.120 node02.linuxtips' >>/etc/hosts
echo '10.20.20.130 node03.linuxtips' >>/etc/hosts

curl -fsSL https://get.docker.com | bash
systemctl start docker
systemctl enable docker
usermod -aG docker vagrant
