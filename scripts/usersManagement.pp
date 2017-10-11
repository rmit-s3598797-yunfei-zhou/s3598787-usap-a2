class usersManagement {
  #install the shell packages
  package { 'csh':
    ensure => 'installed',
  }

  #groups management
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

  #users Management
  user { 'becca':
    ensure => present, 
    home => '/home/becca',
    uid =>  '10018797',
    shell => '/bin/bash',
    password => '$1$fAVb8Rx5$dPRNhLgso7wtdG6b8QaF4/',
    groups => ['sysadmin','cars'],
  }
  user { 'fred':
    ensure => present,
    home => '/home/fred',
    uid =>  '10028797',
    shell => '/bin/csh',
    password => '$1$fAVb8Rx5$dPRNhLgso7wtdG6b8QaF4/',
    groups => ['trucks','cars'],
  }
  user { 'wilma':
    ensure => present,
    home => '/home/wilma',
    uid =>  '10038797',
    password => '$1$fAVb8Rx5$dPRNhLgso7wtdG6b8QaF4/',
    groups => ['trucks','cars','ambulances'],
    
  }
  file { '/home/wilma/.ssh':
    ensure => directory,
    owner  => wilma,
  }
  ssh_authorized_key{ 'wilma_SSH':
    user => 'wilma',
    type => 'ssh-rsa',
    key => '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',

  }
  
}