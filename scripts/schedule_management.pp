# Task 2 Option 2
# Class: scheduleManagement
#
#
class schedule_management {
  # resources

  schedule { 'everyday':
    period => hourly,
    repeat => '3'
  }
  #This will cause resources to be applied every 20 minutes by default. (3 Times / hour )
  exec { 'sudo /usr/local/bin/puppet agent -t':
    schedule => 'everyday',
    path     => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
  }

}
