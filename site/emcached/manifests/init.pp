class memcached {
  Package {'memcached':
    ensure => present,
    }
  
  file {'memcached config':
    ensure  => file,
    path    => '/etc/sysconfig/memcached',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/memcached/memcached.conf',
    require => Package['memcached'],
  }

  service {'memcached' :
    ensure => running,
    enable => true,
    subscribe => File['memcached config'],
    }
}
