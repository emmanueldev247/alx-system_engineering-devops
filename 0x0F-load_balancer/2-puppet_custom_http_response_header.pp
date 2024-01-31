# Add a custom HTTP header with Puppet

exec { 'add nginx stable repo':
  command => 'sudo add-apt-repository ppa:nginx/stable',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

# update software packages list
exec { 'update packages':
  command => 'apt-get update',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

# install nginx
package { 'nginx':
  ensure     => 'installed',
}

# add custom header
file_line { 'add custom header':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "\n\tset $my_host $hostname;\n\tadd_header X-Served-By $my_host;"
  after  => 'server_name _;',
}

# restart nginx
exec { 'restart service':
  command => 'service nginx restart',
  path    => '/usr/bin:/usr/sbin:/bin',
}
