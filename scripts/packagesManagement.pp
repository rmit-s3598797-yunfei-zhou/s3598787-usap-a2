class packagesManagement {

  exec { 'yum':                    # exec resource named 'apt-update'
    command => '/usr/bin/yum update -y'  # command this resource will run
  }

  #install the shell packages
  package { 'openssh':
    ensure => installed,
  }

  package { 'httpd':
    ensure => installed,
  }
  package { 'mysql':
    ensure => installed,
  }
  package { 'mysql-server':
    ensure => installed,
  }

  package { 'php':
    ensure => installed,  
  }

  package { 'tigervnc-server':
    ensure => installed,
  }
  package { 'tmux':
    ensure => installed,
  }
  package { 'dia2code':
    ensure => installed,
  }
  package { 'lynx':
    ensure => installed,
  }
  package { 'gcc':
    ensure => installed,
  }
  package { 'gdb':
    ensure => installed,
  }
  package { 'cgdb':
    ensure => installed,
  }
  package { 'vim':
    ensure => installed,
  }
  package { 'emacs':
    ensure => installed,
  } 
  package { 'sshfs':
    ensure => installed,
  }

  # ensure apache2 service is running
  service { 'httpd':
    ensure => running,
  }

  # ensure mysql service is running
  service { 'mysql':
    ensure  => running,
    enable  => true,
    require => Package['mysql-server'],
  }





  
  
}