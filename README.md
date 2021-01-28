# Mininet VM with Vagrant

Install Vagrant, and run the VM with `vagrant up`!

## Usage

* Install [Vagrant](https://www.vagrantup.com/downloads).
  If you are using Homebrew on macOS, you can simply run `brew install vagrant`.
  If you haven't already, you will also need to install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) as
  the provider for your VM.
  
  **EDIT: Unfortunately the official Ubuntu box only works with VirtualBox.**

* Clone/download this repo and `cd` into the directory.
* Run `vagrant up`. This should set up your VM in a few minutes.
* Run `vagrant ssh` in the directory to SSH into the VM.
* Run `sudo mn --test pingall` within the VM to test that Mininet has been installed properly.
* If you need to copy files from/to the VM, you can use the [vagrant-scp](https://github.com/invernizzi/vagrant-scp)
  plugin: install with 
      
      vagrant plugin install vagrant-scp
      
  and then you can copy files to the VM:

      vagrant scp local/path/to/file :remote/path/to/file

  or from the VM: 

      vagrant scp :remote/path/to/file local/path/to/file
     
  Alternatively, you can use the [synced folders feature](https://www.vagrantup.com/docs/synced-folders/basic_usage) to edit files in the VM locally.

* To use VSCode with the Vagrant VM, first run `vagrant ssh-config` in the
  repo's directory, and then append the output to your `~/.ssh/config` file.
  You can rename the host as you like (change the first line to `Host mininet`).
  Then in VSCode you can connect to the `mininet` host.
  
  You can install the Python and Pylance extensions on the VM. You can add
  `/home/vagrant/mininet`, `/home/vagrant/pox`, `/home/vagrant/openflow`
  to the `"python.analysis.extraPaths"` settings to make code analysis work
  properly.

## Using Wireshark

* You might need to install XQuartz (for macOS) or Xming (for Windows) for X11 forwarding.
* To use Wireshark, first install it:

      sudo apt install wireshark

* As the `vagrant` user, run `sudo xauth add $(xauth list $DISPLAY)` to allow `root` to use X11 Forwarding.
  You might have to do this every time you want to run Wireshark.
* Run `sudo wireshark &` to run Wireshark in the background.
* Once the controller is up, you will see the interfaces (e.g. `s1-eth1`) in Wireshark. You can choose any
  of them and view the packets it sends/receives.


## Notes

* Because of compatibility issues in `pox`, we are stuck with Python 2 for now.
  We use the `fangtooth` version of `pox` and version `2.3.0d6` of Mininet.
* If you are located in China and experience difficulty downloading Vagrant boxes, you can use
  [Tsinghua University's mirror](https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/focal/current/).
  Simply run the following command before executing `vagrant up`:
  
      vagrant box add https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/focal/current/focal-server-cloudimg-amd64-vagrant.box --name ubuntu/focal64

* If you don't feel like installing Vagrant, you can also spin up your own Ubuntu VM on your favorite VM provider (VMware/VirtualBox/HyperV) or even cloud provider (AWS EC2?) and run the `bootstrap.sh` script to set up Mininet. We recommend using Vagrant because it abstracts away many provider- and OS-specific nuances, which have historically troubled many students getting set up for the project.
