class packagesManagement {

  exec{ 'enableOptional':
    command => 'sudo yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional'
  }#vYou need to enable the optional channels. On AWS this is done in a different way: yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
#https://serverfault.com/questions/725272/how-to-install-lynx-on-an-aws-redhat-machine-that-cant-find-the-package

  exec { 'yum':  # exec resource named 'apt-update'
    command => '/usr/bin/yum update -y'  # command this resource will run
  }

  #install the shell packages
  package { 'openssh':
    ensure => installed,
  }

  package { 'httpd':
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
  
  # package { 'cgdb':
  #   ensure => installed,
  # }
  package { 'vim':
    ensure => installed,
  }
  package { 'emacs':
    ensure => installed,
  } 
  package { 'sshfs':
    ensure => installed,
  }

  package { 'git':
    ensure => installed,
  }
  package { 'wget':
    ensure => installed,
  }


  #manual install paskages
  exec { 'install_cgdb':  # exec resource named 'apt-update'
 
    command => 'git clone git://github.com/cgdb/cgdb.git && cd cgdb &&./autogen.sh &&./configure --prefix=/usr/local && make && sudo make install && cd ..&& sudo rm -rf ./cgdb',  # command this resource will run
  }

  exec { 'install_dia2code':  # exec resource named 
 
    command => 'wget https://jaist.dl.sourceforge.net/project/dia2code/dia2code/0.8.3/dia2code-0.8.3-3.1.i586.rpm && sudo rpm -Uvh dia2code-0.8.3-3.1.i586.rpm && rm dia2code-0.8.3-3.1.i586.rpm',  # command this resource will run
  }

  exec { 'install_mysql':  # exec resource named 
    command => 'wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm && sudo rpm -Uvh mysql57-community-release-el7-11.noarch.rpm && rm mysql57-community-release-el7-11.noarch.rpm',  # command this resource will run
  }
  }
  package { 'mysql-server':
    ensure => installed,
  }


  

  # ensure apache2 service is running
  service { 'httpd':
    ensure => running,
    enable  => true,
  }

  # ensure mysql service is running
  service { 'mysqld':
    ensure  => running,
    enable  => true,
  
  }

  # ensure mysql service is running
  service { 'vncserver':
    ensure  => running,
    enable  => true,
  
  }

  




  
  
}