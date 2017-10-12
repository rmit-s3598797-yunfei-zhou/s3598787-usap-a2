#Task 2
class runiterval_management {
  # # Option 1:
  # augeas { 'interval':
  # context => '/files/etc/puppetlabs/puppet/puppet.conf',
  #     changes => 'set runiterval 1200', #check in for every 20 minutes / 3 times each hour
  # }
  # resources

  #Option 2
  # schedule { 'everyday':
  #   period => hourly,
  #   repeat  => "3"
  # }
  # #This will cause resources to be applied every 20 minutes by default. (3 Times / hour )
  # exec { "sudo /usr/local/bin/puppet agent -t":
  #   schedule => 'everyday',
  #    path  => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
  # }
  exec { 'sudo /usr/local/bin/puppet agent --runinterval  1200':
  path  => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
}

}
