class ngnix {
  package {'ngnix':
    ensure => present,
  }
  
  file {'/var/www':
    ensure => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
  
  file {'ngnix dir':
    ensure => directory,
    path    => '/etc/nginx',
  }
  
  file {'ngnix conf':
    ensure => present,
    path    => '/etc/nginx/nginx.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/ngnix/ngnix.conf',
    require = File['nginx dir'],
  }
  
  file {'/etc/ngnix/conf.d':
    ensure => directory,
  }
  
  file {'ngnix default':
    ensure => present,
    path    => '/etc/ngnix/conf.d/default.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}  
