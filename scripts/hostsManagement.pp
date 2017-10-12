#Task 5
class hostsManagement {

  # create a fully qualified full host entry with an alias
  host { 'titan.csit.rmit.edu.au':
    ip           => '131.170.5.131',
    host_aliases => 'titan',
  }

  host { 'jupiter.csit.rmit.edu.au':
    ip           => '131.170.5.135',
    host_aliases => 'jupiter',
  }

  host { 'saturn.csit.rmit.edu.au':
    ip           => '131.170.5.132',
    host_aliases => 'saturn',
  }
  # augeas { 'hosts':
  #   context => '/files/etc/hosts',
  #   changes => [
  #     "set * [ipaddr ='131.170.5.131']/canonical tian",
  #     "set * [ipaddr ='131.170.5.131']/alias[1] titan.csit.rmit.edu.au",
  #     "set * [ipaddr ='131.170.5.135']/canonical jupiter",
  #     "set * [ipaddr ='131.170.5.135']/alias[1] jupiter.csit.rmit.edu.au",
  #     "set * [ipaddr ='131.170.5.132']/canonical saturn",
  #     "set * [ipaddr ='131.170.5.132']/alias[1] saturn.csit.rmit.edu.au",
  #   ],
  # }
  
}
