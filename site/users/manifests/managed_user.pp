define users::managed_user (
  $group  = $title,
){
  user { $title :
    ensure => present,
    gid    => $group,
  }
  
  group {$group :
    ensure  => present,
  }
  
  file { "/home/${title}" :
    ensure => directory,
    owner   => $title,
    group   => $group,
  }
}
