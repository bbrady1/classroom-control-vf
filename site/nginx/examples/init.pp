if $::osfamily == 'redhat' {
Package {
provider => centos,
}
}
include nginx
