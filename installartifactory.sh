wget -O artifactory-pro.rpm "https://releases.jfrog.io/artifactory/artifactory-pro-rpms/jfrog-artifactory-pro/jfrog-artifactory-pro-[RELEASE].rpm"

sudo yum install ./artifactory-pro.rpm -y

echo "[jfrog-cli]" > jfrog-cli.repo && echo "name=jfrog-cli" >> jfrog-cli.repo && echo "baseurl=https://releases.jfrog.io/artifactory/jfrog-rpms" >> jfrog-cli.repo && echo "enabled=1" >> jfrog-cli.repo && rpm --import https://releases.jfrog.io/artifactory/jfrog-gpg-public/jfrog_public_gpg.key && sudo mv jfrog-cli.repo /etc/yum.repos.d/ && yum install -y jfrog-cli-v2-jf && jf intro

systemctl enable artifactory
systemctl start artifactory
systemctl status artifactory
