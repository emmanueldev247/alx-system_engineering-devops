# Using Puppet to set client authentication method
file { '/home/ubuntu/.ssh/config':
  ensure  => present,
  content => "IdentityFile ~/.ssh/school\nPasswordAuthentication no\n",
  mode    => '0600',
  owner   => 'ubuntu',
}
