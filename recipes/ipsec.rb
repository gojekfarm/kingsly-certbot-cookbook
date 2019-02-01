# create yaml
node.default['kingsly_certbot']['config']['server_type'] = 'ipsec'
node.default['kingsly_certbot']['config']['ipsec_root'] = '/'

include_recipe 'kingsly_certbot::install'
