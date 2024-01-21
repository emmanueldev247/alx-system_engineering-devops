# Using Puppet to set client authentication method
file { '/etc/ssh/ssh_config':
  ensure => present,
}

# Ensure IdentityFile line is present and has the correct value
file_line { 'identity_file':
  path    => '/etc/ssh/ssh_config',
  line    => 'IdentityFile ~/.ssh/school',
  match   => '^#?IdentityFile\s+.*$',
  ensure  => present,
}

# Ensure PasswordAuthentication line is present and has the correct value
file_line { 'password_authentication':
  path    => '/etc/ssh/ssh_config',
  line    => 'PasswordAuthentication no',
  match   => '^#?PasswordAuthentication\s+.*$',
  ensure  => present,
}
