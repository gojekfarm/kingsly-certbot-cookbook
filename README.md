# Kingsly Certbot Cookbook

Cookbook to install Kingsly Certbot as gem in Chef gemset

# Installation using chef-solo

1. SSH into the box where you want to install kingsly-certbot
1. Create folder `cookbooks` and `cd cookbooks`
1. `git clone https://github.com/gojekfarm/kingsly-certbot-cookbook.git kingsly-certbot`
1. update kingsly-certbot/solo.json `kingsly_certbot.config` with values specific to this setup
1. update kingsly-certbot/solo.json `run_list` to recipe you want to run on the box
1. run from cookbooks folder - `chef-solo -c kingsly-certbot/solo.rb -j kingsly-certbot/solo.json`
1. `kingsly-certbot.service` and `kingsly-certbot.timer` will be installed on the box, with schedule to run every day at 12 PM
