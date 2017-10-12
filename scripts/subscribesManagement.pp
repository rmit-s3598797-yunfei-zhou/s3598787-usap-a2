#Task 8
# Class: subscribesManagement
#Task 8#

#
class subscribesManagement {
  # resources 

  #subscribe sshd 


  # add a notify to the file resource
  file { '/etc/ssh/sshd_config':
    notify  => Service['sshd'],  # this sets up the relationship
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    content => template('ssh/sshd_config.erb'),
  }

  file { '/etc/httpd/conf/httpd.conf':
    notify  => Service['httpd'],  # this sets up the relationship
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    #require => Package['openssh-server'], #already installed
    #content => template('ssh/sshd_config.erb'),
  }


}
