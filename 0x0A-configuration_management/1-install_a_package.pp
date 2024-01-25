# Using Puppet to install Flask from pip3
package { 'python3.8':
    ensure => '3.8.10',
}

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

# Install Werkzeug as a requirement for Flask
package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
  require  => Package['Flask'],
}
