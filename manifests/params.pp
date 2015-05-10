# Default module parameters
class rvm::params($manage_group = true) {

  $group = $::operatingsystem ? {
    default => 'rvm',
  }

  $proxy_url = undef
  $no_proxy = undef
  $key_server = 'hkp://keys.gnupg.net'

  # install the gpg key if gpg is installed or being installed in this puppet run
  $gnupg_key_id = defined(Class['::gnupg']) or $::gnupg_installed ? {
    true  => 'D39DC0E3',
    false => false,
  }

  # ignored param, using gnupg module
  $gpg_package = $::kernel ? {
    /(Linux|Darwin)/ => 'gnupg2',
    default          => undef,
  }
}
