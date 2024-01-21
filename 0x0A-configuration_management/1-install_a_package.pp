# Using Puppet to install flask from pip3
package { 'python3':
    ensure => '3.8.10',
}

package { 'python3-pip':
    ensure  => installed,
    require => Package['python3'],
}

package { 'Flask':
    ensure   => '2.1.0',
    provider => 'pip3',
    require  => Package['python3-pip'],
}

package { 'Werkzeug':
    ensure   => '2.1.1',
    provider => 'pip3',
    require  => Package['python3-pip'],
}
