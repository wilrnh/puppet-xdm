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
# [*xdm_config_append*]
#   Array of lines to append to xdm-config file. Defaults to empty array.
#
class xdm (
    $package_ensure    = $xdm::params::package_ensure,
    $service_ensure    = $xdm::params::service_ensure,
    $xdm_config_append = [],
  ) inherits xdm::params {

  validate_string($package_ensure)
  validate_string($service_ensure)
  validate_array($xdm_config_append)
  
  package{$xdm::params::xdm_package:
    ensure => $package_ensure,
    notify => Service['xdm'],
  }
  
  file{$xdm::params::xdm_config_file:
    ensure  => file,
    content => template('xdm/xdm-config.erb'),
    require => Package[$xdm::params::xdm_package],
    notify  => Service['xdm'],
  }
  
  service{'xdm':
    ensure  => $service_ensure,
    require => File[$xdm::params::xdm_config_file],
  }
  
}
