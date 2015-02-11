#################
# Configuration #
#################

script_url          = "https://raw.githubusercontent.com/jeremymichel/vagrant-rails/master/scripts"

static_ip           = "192.168.33.10"
guest_port          = 3000
host_port           = 3000

ruby_version        = "latest" # use RVM version naming
rails_version       = "latest" # use Gem version naming

mysql_root_password = "root" # cannot be empty

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  # Setup Networking
  config.vm.network "private_network", ip: static_ip
  config.vm.network "forwarded_port", guest: guest_port, host: host_port

  # Sync folders
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  # Set to half the RAM and use all the CPU
  # https://sethvargo.com/faster-rails-development-with-vagrant/
  config.vm.provider "virtualbox" do |v|
    host = RbConfig::CONFIG["host_os"]

    if host =~ /darwin/ # OS X
      # sysctl returns bytes, convert to MB
      v.memory = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 2
      v.cpus = `sysctl -n hw.ncpu`.to_i
    elsif host =~ /linux/ # Linux
      # meminfo returns kilobytes, convert to MB
      v.memory = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 2
      v.cpus = `nproc`.to_i
    end
  end

  ###################################################
  # Setup Provisioning, uncomment a line to install #
  ###################################################

  # Base packages
  config.vm.provision :shell, path: "#{script_url}/base.sh"

  # Ruby via RVM
  config.vm.provision :shell, path: "#{script_url}/ruby.sh", privileged: false, args: [ruby_version, rails_version]

  # SQLite
  # config.vm.provision :shell, path: "#{script_url}/sqlite.sh"

  # PostgreSQL
  config.vm.provision :shell, path: "#{script_url}/postgresql.sh"

  # MySQL
  # config.vm.provision :shell, path: "#{script_url}/mysql.sh", args: [mysql_root_password]

  # MongoDB
  # config.vm.provision :shell, path: "#{script_url}/mongodb.sh"

  # Node.js
  config.vm.provision :shell, path: "#{script_url}/node.sh", privileged: false


end