#Task 1
class users_management {
  #install the shell packages
  package { 'csh':
    ensure => 'installed',
  }

  #groups management
  group { 'sysadmin':
    ensure => present,
  }
  group { 'cars':
    ensure => present,
  }
  group { 'trucks':
    ensure => present,
  }
  group { 'ambulances':
    ensure => present,
  }

  # create the home directory for each user, 
  # due to difference Linux system could place the home directory in different place such as '/User/'
  file { '/home/becca':
    ensure => directory,
    owner  => becca,
  }
  file { '/home/fred':
    ensure => directory,
    owner  => fred,
  }
  file { '/home/wilma':
    ensure => directory,
    owner  => wilma,
  }




  #users Management
  user { 'becca':
    ensure   => present,
    home     => '/home/becca',
    uid      =>  '10018797',
    shell    => '/bin/bash',
    password => '$1$fAVb8Rx5$dPRNhLgso7wtdG6b8QaF4/',
    groups   => ['sysadmin','cars'], # set groups for becca
  }

  user { 'fred':
    ensure   => present,
    home     => '/home/fred',
    uid      =>  '10028797',
    shell    => '/bin/csh',
    password => '$1$fAVb8Rx5$dPRNhLgso7wtdG6b8QaF4/',
    groups   => ['trucks','cars'], # set groups for fred
  }
  user { 'wilma':
    ensure   => present, # make sure this user will be created by puppet
    home     => '/home/wilma', # set home directory
    uid      =>  '10038797', # default user id 1003+ my last 4 student id
    password => '$1$fAVb8Rx5$dPRNhLgso7wtdG6b8QaF4/', # managed the user's password
    groups   => ['trucks','cars','ambulances'], # set groups for wilma
  }

  # create the .ssh directory for wilma 
  file { '/home/wilma/.ssh':
    ensure => directory,
    owner  => wilma,
  }
  # store the private key in the wilma's .ssh folder
  ssh_authorized_key{ 'wilma_SSH':
    user => 'wilma',
    type => 'ssh-rsa',
    key  => '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',
  }
  file { '/home/wilma/.ssh/wilmapk':
    ensure => file,
    owner  => wilma,
  }

  file { '/home/wilma/.ssh/wilma_public.pub':
    ensure => file,
    owner  => wilma,
  }

  # write the private key for wilma
  exec { 'echo "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" > /home/wilma/.ssh/wilmapk':
    path  => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
  }
  exec { 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDiB2dw8SmxD8M163xV2ExtYKuL9RRkHcbZLqPghTo+7IH4aKYCqsd1lGU89ToPQtl1qK+Ij7jSbbsW98cfImP1FV8mAgsV60wraOB2WRk9wJlxZdYAmoZ9JXDgzebdcfP5jGdoCr7HmoG/B1GhKk6YkfKjWgvyXxLyKtJGTRCwQvYaqCBdEVM0atZvME7ZRc8H9q4iylXpDeTs2FooiSKGt7YIQ1iZAYQRnxucB7pZimDKcczMZcfy8hcOcISUGDNrNjpqDwD/JrQwL9fShDPrZnAUWxmM7jt10WQ9sp8UJ5bcDYLS6fn7vyZLTTfKNx+BZAiISkJ09hRiVr6CX8NZCmZRbV4PgfZrswJ9+JpBwOOqmIs1+NhP/J7XNmG6Uu8QpW92XZ+oyK7inTdKaW3R4bqC+pkqxs9+SIb92peFriGLjqnE7hVhwruQj0uH6uizUc716xhp1vV0yMRd5jZK3B5bf6vYkqOC+ggITPuzMzDBJ+hUAhEy3D/R2+2UfyQ+/bgL3p6smlzSSq8wRedExA6lKZ5iLTB877YcB2DcDuW17Pe9Uyqql+mmIE7AqecZFGBB/rZTQMtVCzTp8RfYxVK3JXF/NXKomj08QXY5Mv/do+Y3K/c96QQ1afMhXEvUF9f71rgmCdzUsnc2ZbBEN/lx9c2FrHjkkYS7kmb/w== s3598797@csitprdap01" > /home/wilma/.ssh/wilma_public.pub':
    path  => ['/usr/bin', '/usr/sbin','/usr/local/bin'],
  }

}
