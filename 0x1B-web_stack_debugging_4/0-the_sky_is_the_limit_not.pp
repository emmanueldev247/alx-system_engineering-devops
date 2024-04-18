# Increase the amount of traffic nginx can handle

# Increase ULIMIT value to 4096
exec {'increase ULIMIT value':
            command => 'sed -i "s/15/4096/" /etc/default/nginx',
        path => '/bin/:/usr/bin/:/usr/local/bin'
}

# Restart nginx
exec {'restart nginx':
        command => '/usr/sbin/service nginx restart',
        path => '/usr/sbin/:/sbin:/bin:/usr/bin'
}
