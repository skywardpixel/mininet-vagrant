# Mininet VM with Vagrant

Install Vagrant, and run the VM with `vagrant up`!

## Usage

* Install [Vagrant](https://www.vagrantup.com/downloads).
  If you are using Homebrew on macOS, you can simply run `brew install vagrant`.
* Clone this repo and `cd` into the directory.
* Run `vagrant up`. This should set up your VM in a few minutes.
* Run `vagrant ssh` in the directory to SSH into the VM.
* If you need to copy files from/to the VM, you can use the [vagrant-ssh](https://github.com/invernizzi/vagrant-scp)
  plugin: install with 
      
      vagrant plugin install vagrant-scp
      
  and then you can copy files to the VM:

      vagrant scp local/path/to/file :remote/path/to/file

  or from the VM: 

      vagrant scp :remote/path/to/file local/path/to/file

* To use VSCode with the Vagrant VM, first run `vagrant ssh-config` in the
  repo's directory, and then append the output to your `~/.ssh/config` file.
  You can rename the host as you like (change the first line to `Host mininet`).
  Then in VSCode you can connect to the `mininet` host.

## Notes

* Because of compatibility issues in `pox`, we are stuck with Python 2 for now.
  We use the `fangtooth` version of `pox` and version `2.3.0d6` of Mininet.

