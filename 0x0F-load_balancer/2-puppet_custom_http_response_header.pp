# Add a custom HTTP header with Puppet
exec { 'apt-update':
  command => '/usr/bin/apt-get -y update',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}


package { 'nginx':
  ensure => installed,
}

# Configure Nginx to add the custom HTTP header
file_line { 'add custom header':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "\tadd_header X-Served-By ${hostname};",
  after  => 'server_name _;',
}

# Ensure Nginx is running
service { 'nginx':
  ensure => running,
}
