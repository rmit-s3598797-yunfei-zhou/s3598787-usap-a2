#Task 3
class packages_management {

  exec{ 'sudo /usr/bin/yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional && exit':
    path    => ['/usr/bin', '/usr/sbin',],
  }
  #vYou need to enable the optional channels. On AWS this is done in a different way: yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
#https://serverfault.com/questions/725272/how-to-install-lynx-on-an-aws-redhat-machine-that-cant-find-the-package



  exec { 'sudo /usr/bin/yum update -y':  # command this resource will run
    path    => ['/usr/bin', '/usr/sbin',],
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


  package { 'git':
    ensure => installed,
  }
  package { 'wget':
    ensure => installed,
  }


  #manual install paskages


  #install dia2code
  package { 'libxml2-devel ':
      ensure => installed,
  }


  # exec {  'wget https://jaist.dl.sourceforge.net/project/dia2code/dia2code/0.8.3/dia2code-0.8.3-3.1.i586.rpm ; sudo rpm -Uvh dia2code-0.8.3-3.1.i586.rpm ; rm dia2code-0.8.3-3.1.i586.rpm':  # command this resource will run
  #   path  => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
  # }

  exec {  'wget http://prdownloads.sourceforge.net/dia2code/dia2code-0.8.3.tar.gz ; tar -xvf dia2code-0.8.3.tar.gz; cd dia2code-0.8.3;  bash ./configure; sudo make; sudo install; cd ..; rm -rf dia2code-0.8.3; rm dia2code-0.8.3.tar.gz':  # command this resource will run
      path  => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
  }

  # install mysql-server
  exec { 'wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm ; sudo rpm -Uvh mysql57-community-release-el7-11.noarch.rpm ; rm mysql57-community-release-el7-11.noarch.rpm':  # command this resource will run
    path  => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
  }
  package { 'mysql-server':
    ensure => installed,
  }


  #install the epel for cgdb and sshfs
  exec{ 'wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm; rpm -ivh epel-release-latest-7.noarch.rpm; rm epel-release-latest-7.noarch.rpm':
   path    => ['/usr/bin', '/usr/sbin',],
  }

  package { 'cgdb':
    ensure => installed,
  }
  package { 'fuse-sshfs':
    ensure => installed,
  }

  # ensure apache2 service is running
  service { 'httpd':
    ensure => running,
    enable => true, # Make sure it will start on boot
  }
  # ensure mysql service is running
  service { 'mysqld':
    ensure => running,
    enable => true, # Make sure it will start on boot

  }

  #ensure openssh is running
  service { 'sshd':
    ensure => running,
    enable => true, # Make sure it will start on boot

  }

  # service { 'vncserver':
  #   ensure  => running,
  #   enable  => true,

  # }



}
