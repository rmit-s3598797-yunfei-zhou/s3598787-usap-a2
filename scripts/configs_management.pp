#Task 4


class configs_management{

  #a. disable root login for ssh
  augeas { 'sshd_config':
    context => '/files/etc/ssh/sshd_config',
    changes =>[
    'set PermitRootLogin no',
  ],
  }

#b. disable root login for ssh
# Make sure the directory is exist

file{'/var/www/s3598797':
    ensure  =>  directory,
#    mode    =>  0755,
}
augeas { 'httpd_conf':
  context => '/files/etc/httpd/conf/httpd.conf',
  changes => [
      'set directive[.="DocumentRoot"] "DocumentRoot"',
      "set directive[.='DocumentRoot']/arg '/var/www/s3598797'",
    ],
}
#reference：
#https://stackoverflow.com/questions/34094284/setting-servername-with-augeas
exec{ 'sudo services sshd restart':
  path  => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
}

#c. sudoers must allow becca to sudo to a root shell

  # augeas { 'sudobecca':
  #     context => '/files/etc/sudoers',
  #     changes => [
  #         "set spec[user = 'becca']/user becca",
  #         "set spec[user = 'becca']/host_group/host ALL",
  #         "set spec[user = 'becca']/host_group/command SERVICES",
  #         "set spec[user = 'becca']/host_group/command/runas_user root",
  #         "set spec[user = 'becca']/host_group/command/tag NOPASSWD",
  #     ],
  # }
#still get error 


#d. fred is also required to be able to sudo to root but in this case you must achieve this using groups,
#not modification of the sudoers file

exec{ 'sudo usermod -aG wheel fred':
  path  => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
}

#e.
Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/','/usr/local/bin' ] }


f.
#mount
file { '/home/becca/titan':
  ensure => directory,
  owner  => becca,
}
# mount { '/home/becca/titan':
#   ensure  => mounted,
#   device  => 'sshfs#s3598797@titan.csit.rmit.edu.au:~/',
#   fstype  =>  'xfs',
# }

# echo '2015Love1005!!'|sudo sshfs -o allow_other s3598797@titan.csit.rmit.edu.au:~/ /home/becca/titan   
# sudo sshfs -o allow_other -p 2015Love1005!! s3598797@titan.csit.rmit.edu.au:~/ /home/becca/titan                    


exec { "sudo sshfs -o allow_other -p 2015Love1005!! s3598797@titan.csit.rmit.edu.au:~/ /home/becca/titan":
  path => ['/usr/bin','/usr/sbin','/usr/local/bin',],
}



}
