# -*- mode: ruby -*-
# vi: set ft=ruby :

# Provisioning script
$script = <<SCRIPT
  echo "*** Updating packages"
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y aptitude
  sudo DEBIAN_FRONTEND=noninteractive aptitude update
  sudo DEBIAN_FRONTEND=noninteractive aptitude -y safe-upgrade
  echo "*** Installing new packages"
  sudo DEBIAN_FRONTEND=noninteractive aptitude install -y curl git-core vim
  if rvm -v 2>/dev/null; then
    echo "*** rvm already installed, skipping"
  else
    echo "*** Installing rvm"
    gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable --ruby
    echo "gem: --no-document" > ~/.gemrc
    echo "*** Finished installing rvm"
  fi
  echo "*********************"
  echo "PROVISIONING FINISHED"
  echo "*********************"
SCRIPT


Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/xenial64'
  config.vm.hostname = 'adkit-dev'

  config.vm.provision 'shell', inline: $script, privileged: false
end
