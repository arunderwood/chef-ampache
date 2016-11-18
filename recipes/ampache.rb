#
# Cookbook Name:: chef-ampache
# Recipe:: ampache
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node['chef-ampache']['dirs'].each do |dir|
  directory dir.to_s do
    action :create
    owner node['chef-ampache']['user']
    group node['chef-ampache']['group']
  end
end

template '/usr/share/ampache/www/config/ampache.cfg.php' do
  source 'ampache.cfg.php.erb'
  variables(
    default_playlist_folder: node['chef-ampache']['default_playlist_folder'],
    config_version: node['chef-ampache']['config_version'],
    web_path: node['chef-ampache']['web_path'],
    database_hostname: node['chef-ampache']['database_hostname'],
    database_name: node['chef-ampache']['database_name'],
    database_username: node['chef-ampache']['database_username'],
    database_password: node['chef-ampache']['database_password'],
    session_length: node['chef-ampache']['session_length'],
    stream_length: node['chef-ampache']['stream_length'],
    remember_length: node['chef-ampache']['remember_length'],
    session_name: node['chef-ampache']['session_name'],
    session_cookielife: node['chef-ampache']['session_cookielife'],
    session_cookiesecure: node['chef-ampache']['session_cookiesecure'],
    auth_methods: node['chef-ampache']['auth_methods'],
    catalog_file_pattern: node['chef-ampache']['catalog_file_pattern'],
    catalog_video_pattern: node['chef-ampache']['catalog_video_pattern'],
    catalog_prefix_pattern: node['chef-ampache']['catalog_prefix_pattern'],
    access_control: node['chef-ampache']['access_control'],
    require_session: node['chef-ampache']['require_session'],
    require_localnet_session: node['chef-ampache']['require_localnet_session'],
    track_user_ip: node['chef-ampache']['track_user_ip'],
    allow_zip_download: node['chef-ampache']['allow_zip_download'],
    file_zip_download: node['chef-ampache']['file_zip_download'],
    file_zip_path: node['chef-ampache']['file_zip_path'],
    tag_order: node['chef-ampache']['tag_order'],
    use_auth: node['chef-ampache']['use_auth'],
    default_auth_level: node['chef-ampache']['default_auth_level'],
    ratings: node['chef-ampache']['ratings'],
    shoutbox: node['chef-ampache']['shoutbox'],
    album_art_preferred_filename: node['chef-ampache']['album_art_preferred_filename'],
    album_art_order: node['chef-ampache']['album_art_order'],
    show_album_art: node['chef-ampache']['show_album_art'],
    amazon_base_urls: node['chef-ampache']['amazon_base_urls'],
    max_amazon_results_pages: node['chef-ampache']['max_amazon_results_pages'],
    debug: node['chef-ampache']['debug'],
    debug_level: node['chef-ampache']['debug_level'],
    site_charset: node['chef-ampache']['site_charset'],
    refresh_limit: node['chef-ampache']['refresh_limit'],
    allow_public_registration: node['chef-ampache']['allow_public_registration'],
    captcha_public_reg: node['chef-ampache']['captcha_public_reg'],
    mail_domain: node['chef-ampache']['mail_domain'],
    mail_from: node['chef-ampache']['mail_from'],
    mail_check: node['chef-ampache']['mail_check'],
    admin_notify_reg: node['chef-ampache']['admin_notify_reg'],
    max_bit_rate: node['chef-ampache']['max_bit_rate'],
    min_bit_rate: node['chef-ampache']['min_bit_rate'],
    transcode_m4a: node['chef-ampache']['transcode_m4a'],
    force_ssl: node['chef-ampache']['force_ssl'],
    transcode_m4a_target: node['chef-ampache']['transcode_m4a_target'],
    transcode_flac_target: node['chef-ampache']['transcode_flac_target'],
    transcode_mp3_target: node['chef-ampache']['transcode_mp3_target'],
    transcode_ogg_target: node['chef-ampache']['transcode_ogg_target'],
    transcode_cmd_flac: node['chef-ampache']['transcode_cmd_flac'],
    transcode_cmd_m4a: node['chef-ampache']['transcode_cmd_m4a'],
    transcode_cmd_mp3: node['chef-ampache']['transcode_cmd_mp3'],
    transcode_cmd_ogg: node['chef-ampache']['transcode_cmd_ogg'],
    use_rss: node['chef-ampache']['use_rss']
  )
  owner node['chef-ampache']['user']
  group node['chef-ampache']['group']
  notifies :restart, resources(service: node['chef-ampache']['service'])
end
