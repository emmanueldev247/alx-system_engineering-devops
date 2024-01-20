# Using Puppet to install flask from pip3
package { 'flask':
    provider => 'pip3',
    ensure   => '2.1.0',
    require  => Package['python3-pip']
}
