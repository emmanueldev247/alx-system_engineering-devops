# Install & Configure Nginx web server (w/ Puppet)
package { 'nginx':
    ensure => installed
}

class { 'ufw':
    before => Class['nginx'],
}

ufw::allow { 'Nginx HTTP':
    proto => 'tcp',
    port  => 80,
}

# Ensure the Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Create the index.html file with the specified content
file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Hello, world!',
  require => Service['nginx'],
}

# Create the index.html file with the specified content
file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Hello, world!',
  require => Service['nginx'],
}

# Restart Nginx after updating the configuration
exec { 'nginx-restart':
  command     => 'service nginx restart',
  refreshonly => true,
  subscribe   => [Service['nginx'], File['/var/www/html/index.html']],
}
