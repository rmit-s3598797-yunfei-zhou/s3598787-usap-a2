class userManagement {
  group { 'sysadmin':
    ensure => present,
  }
  group { 'cars':
    ensure => present,
  }
  group { 'trucks':
    ensure => present,
  }
  group { 'ambulances':
    ensure => present,
  }

  user { 'becca':
    ensure => present,
    home => '/home/becca',
    uid =>  '10018797'
    shell => '/bin/bash',
    groups => ['sysadmin','cars'],
  }
  user { 'fred':
    ensure => present,
    home => '/home/fred',
    uid =>  '10028797'
    shell => '/bin/csh',
    groups => ['trucks','cars'],
  }
  user { 'wilma':
    ensure => present,
    home => '/home/wilma',
    uid =>  '10028797'
    groups => ['trucks','cars','ambulances'],
  }
  
}