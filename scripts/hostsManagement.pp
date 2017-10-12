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
 
  
}
