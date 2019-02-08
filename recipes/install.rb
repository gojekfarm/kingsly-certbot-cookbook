# install the gem in chef gemset
chef_gem 'kingsly_certbot' do
  version node['kingsly_certbot']['version']
end

# create config file
def keys_to_upcase(config)
  config.to_hash.inject({}) {|c, k| c[k[0].upcase] = k[1]; c}
end

kingsly_config = keys_to_upcase(node['kingsly_certbot']['config'])
config_filepath = node['kingsly_certbot']['config_filepath']

file config_filepath do
  content kingsly_config.to_yaml
end

# add cron to launch kingsly-certbot
systemd_unit 'kingsly-certbot.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Kinglsy certbot to update SSL certificate of local system
  After=network.target

  [Service]
  Type=oneshot
  Environment="LOG_DIR=/var/log"
  ExecStart=/opt/chef/embedded/bin/kingsly-certbot --config #{config_filepath}

  [Install]
  WantedBy=multi-user.target
  EOU

  action [:create, :enable, :start]
end

systemd_unit 'kingsly-certbot.timer' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Run kingsly-certbot.service every day
  After=network.target

  [Timer]
  OnCalendar=#{node["kingsly_certbot"]["cron"]}

  [Install]
  WantedBy=multi-user.target
  EOU

  action [:create, :enable, :start]
end
