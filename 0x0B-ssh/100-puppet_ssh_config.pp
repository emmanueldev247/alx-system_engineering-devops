# Using Puppet to set client authentication method
class ssh_config {
  $ssh_config_path = '/etc/ssh/ssh_config'
  $identity_file = '~/.ssh/school'

  augeas { 'Turn off password authentication':
    context => "/files${ssh_config_path}",
    changes => [
      'set PasswordAuthentication no',
    ],
  }

  augeas { 'Declare identity file':
    context => "/files${ssh_config_path}",
    changes => [
      "set IdentityFile ${identity_file}",
    ],
  }
}
