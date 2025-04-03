install git
install docker

sudo yum install -y git

git clone https://github.com/CajuCLC/cstrike-docker

sudo dnf install -y docker

sudo systemctl enable docker
sudo systemctl start docker

nano podbot/podbot.cfg

sudo docker image build -t cs16-no-bot . 

nano docker-compose // update docker image

# docker-compose (latest version)
$-> sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# Fix permissions after download
$-> sudo chmod +x /usr/local/bin/docker-compose
# Verify success
$-> docker-compose version
