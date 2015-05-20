# == Class: xdm::params
#
# Just some params.pp
#
class xdm::params {
  
  $package_ensure = 'present'
  $service_ensure = 'running'
  
  case $::operatingsystem {
    'Ubuntu': {
      case $::operatingsystemmajrelease {
        '14.04': {
          $xdm_package = 'xdm'
          $xdm_config_file = '/etc/X11/xdm/xdm-config'
        }
        
        default: {
          fail("Unsupported platform: ${module_name} currently doesn't support ${::operatingsystem} ${::operatingsystemmajrelease}")
        }
      }
    }
    
    default: {
      fail("Unsupported platform: ${module_name} currently doesn't support ${::operatingsystem}")
    }
  }
}
