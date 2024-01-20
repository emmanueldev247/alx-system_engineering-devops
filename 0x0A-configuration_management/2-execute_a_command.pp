# Using Puppet to kill a process named killmenow
exec {'kill process':
  refreshonly => true,
}
