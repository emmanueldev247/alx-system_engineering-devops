# Install & Configure Nginx web server (w/ Puppet)
exec { 'update packages':
  command => 'apt-get update',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

package { 'nginx':
    ensure => installed
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

class { 'ufw':
    before => Class['nginx'],
}

ufw::allow { 'Nginx HTTP':
    proto => 'tcp',
    port  => 80,
}

ufw::allow {'SSH':
    proto => 'tcp',
    port  => 22,
}

file { '/var/www':
  ensure => directory,
  mode   => '0755',
  force  => true,
}

file { '/var/www/html/index.html':
  ensure  => present,
  content => "Hello World!\n",
}

file { '/var/www/html/404.html':
  ensure  => present,
  content => "Ceci n'est pas une page\n",
}

file { 'Nginx default config file':
  ensure  => file,
  path    => '/etc/nginx/sites-enabled/default',
  content =>
"server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;

        server_name _;
        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files \$uri \$uri/ =404;
        }

        error_page 404 /404.html;
        location  /404.html {
            internal;
        }

        rewrite ^/redirect_me https://www.youtube.com/ permanent;
}
",
}

exec { 'nginx-restart':
  command     => 'service nginx restart',
}
