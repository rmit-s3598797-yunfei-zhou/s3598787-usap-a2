#Task 8
# Class: subscribesManagement
#Task 8#

#
class subscribes_management {
  # resources

  #subscribe sshd


  # add a notify to the file resource
  file { '/etc/ssh/sshd_config':
    notify => Service['sshd'],  # this sets up the relationship
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    # content => template('/etc/ssh/sshd_config.rpmnew'),
  }

  file { '/etc/httpd/conf/httpd.conf':
    notify => Service['httpd'],  # this sets up the relationship
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    #require => Package['openssh-server'], #already installed
    #content => template('ssh/sshd_config.erb'),
  }


}
