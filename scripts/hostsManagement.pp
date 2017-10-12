#Task 5
class hostsManagement {
  
  augeas { 'hosts':
    context => '/files/etc/hosts',
    changes => [
      "set * [ipaddr ='131.170.5.131']/canonical tian",
      "set * [ipaddr ='131.170.5.131']/alias[1] titan.csit.rmit.edu.au",
      "set * [ipaddr ='131.170.5.135']/canonical jupiter",
      "set * [ipaddr ='131.170.5.135']/alias[1] jupiter.csit.rmit.edu.au",
      "set * [ipaddr ='131.170.5.132']/canonical saturn",
      "set * [ipaddr ='131.170.5.132']/alias[1] saturn.csit.rmit.edu.au",
    ],
  }
  
}
