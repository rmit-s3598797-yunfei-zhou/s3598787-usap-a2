#Task 4.e & 7
# Class: globalPATHManagement
#
#
class globalPATHManagement {
  #  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/','/usr/local/bin' ] }
   Exec { path => '/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/puppetlabs/bin' }
}
