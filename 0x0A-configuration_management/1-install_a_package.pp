# Ensure Python3 and pip3 are installed
package { 'python3':
    ensure => installed,
}

package { 'python3-pip':
    ensure  => installed,
    require => Package['python3'],
}

# Install Flask version 2.1.0 using pip3
package { 'flask':
    ensure   => '2.1.0',
    provider => 'pip3',
    require  => Package['python3-pip'],
}

