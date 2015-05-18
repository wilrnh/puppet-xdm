# == Class: xdm
#
# Initializes the module
#
# === Parameters
#
# [*package_ensure*]
#   Passed directly on to Puppet's `package` type `ensure` parameter. Defaults to `present`.
#
# [*service_ensure*]
#   Passed directly on to Puppet's `service` type `ensure` parameter. Defaults to `running`.
#
class xdm (
    $package_ensure = $xdm::params::package_ensure,
    $service_ensure = $xdm::params::service_ensure,
  ) inherits xdm::params {

  package{$xdm::params::xdm_package:
    ensure => $package_ensure,
    notify => Service['xdm'],
  }
  
  service{'xdm':
    ensure  => $service_ensure,
    require => Package[$xdm::params::xdm_package],
  }
  
}
