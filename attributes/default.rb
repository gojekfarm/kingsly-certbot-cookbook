default['kingsly_certbot']['version'] = ENV['CERTBOT_GEM_VERSION'] || '0.3.3'
default['kingsly_certbot']['cron'] = '*-*-* 12:00:0'
default['kingsly_certbot']['config_filepath'] = '/etc/default/kingsly-certbot.conf'
default['kingsly_certbot']['config']['environment'] = ENV['ENVIRONMENT'] || 'production'
default['kingsly_certbot']['config']['top_level_domain'] = ENV['TOP_LEVEL_DOMAIN'] || 'example.com'
default['kingsly_certbot']['config']['sub_domain'] = ENV['SUB_DOMAIN'] || 'mysubdomain'
default['kingsly_certbot']['config']['sentry_dsn'] = nil
default['kingsly_certbot']['config']['kingsly_server_host'] = ENV['KINGSLY_SERVER_HOST'] || 'localhost'
default['kingsly_certbot']['config']['kingsly_server_port'] = ENV['KINGSLY_SERVER_PORT'] || '8080'
default['kingsly_certbot']['config']['server_type'] = ENV['SERVER_TYPE'] || 'ispec'
