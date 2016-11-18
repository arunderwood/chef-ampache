default['chef-ampache']['packages'] =
  [
    'chef-ampache',
    'ffmpeg',
    'flac',
    'lame'
  ]
default['chef-ampache']['dirs'] =
  [
    '/usr/share/ampache',
    '/var/log/ampache'
  ]
default['chef-ampache']['service'] = 'apache2'
default['chef-ampache']['user'] = 'www'
default['chef-ampache']['group'] = 'www'
