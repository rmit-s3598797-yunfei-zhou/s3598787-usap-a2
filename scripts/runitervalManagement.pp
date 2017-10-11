#Task 2
class runitervalManagement {
    augeas { 'interval':
      context => '/files/etc/puppetlabs/puppet/puppet.conf',
      changes => 'set runiterval = 1200', #check in for every 20 minutes / 3 times each hour
    }
}
