# Add a custom HTTP header with Puppet
exec { 'apt-update':
  command => '/usr/bin/apt-get -y update',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'update packages':
  command => 'apt-get update',
}

package { 'nginx':
  ensure => installed,
}

# Create a basic HTML file
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# Configure Nginx to add the custom HTTP header
file_line { 'add custom header':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "\tadd_header X-Served-By ${hostname};",
  after  => 'server_name _;',
}

# restart nginx
exec { 'restart service':
  command => 'service nginx restart',
  path    => '/usr/bin:/usr/sbin:/bin',
}

# Ensure Nginx is running
service { 'nginx':
  ensure => running,
}
