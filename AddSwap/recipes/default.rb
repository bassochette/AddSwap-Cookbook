#
# Cookbook Name:: AddSwap
# Recipe:: default
#

bash "CreateSwapFile" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  dd if=/dev/zero of=/var/SwapFile bs=1M count=512;
  mkswap /var/SwapFile;
  swapon /var/SwapFile;
  chown root:root /var/SwapFile;
  chmod 0600 /var/SwapFile;
  echo -e "$2\t\tswap\t\tdefaults\t0 0">>/etc/fstab;
  EOH
end