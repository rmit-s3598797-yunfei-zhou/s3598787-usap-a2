#Task 4

class configsManagement {
  
  #a. disable root login for ssh
 augeas { 'sshd_config':
  context => '/files/etc/ssh/sshd_config',
    changes => [
    'set PermitRootLogin no',
  ],
 }
#b. disable root login for ssh
# Make sure the directory is exist

# file{'/var/www/s3598797':
#     ensure  =>  directory,
#     mode    =>  0755,
# }
# augeas { 'httpd_conf':
#   context => '/files/etc/httpd/conf',
#   changes => 'set DocumentRoot "/var/www/s3598797"',
# }

#c. sudoers must allow becca to sudo to a root shell
augeas { 'sudoers':
  context => '/etc/sudoers',
  changes => [
    "set spec[user = 'becca']/user becca",
    "set spec[user = 'becca']/host_group/host ALL",
    "set spec[user = 'becca']/host_group/command ALL",
    "set spec[user = 'becca']/host_group/command/runas_user ALL",
  ],
}
#d. fred is also required to be able to sudo to root but in this case you must achieve this using groups, not modification of the sudoers file
# user { 'fred':
#   groups => ['wheel',],
  
# }
exec{ 'sudo adduser fred wheel':
  path  => ['/usr/bin', '/usr/sbin','/usr/local/bin'],

}


}

