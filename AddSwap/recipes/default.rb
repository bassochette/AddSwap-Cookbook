#
# Cookbook Name:: AddSwap
# Recipe:: default
#
fileLocation = node[:file][:location]
bash "CreateSwapFile" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  dd if=/dev/zero of=#{fileLocation} bs=1M count=512;
  mkswap #{fileLocation};
  swapon #{fileLocation};
  chown root:root #{fileLocation};
  chmod 0600 #{fileLocation};
  echo -e "#{fileLocation}\t\tswap\t\tdefaults\t0 0">>/etc/fstab;
  EOH
end