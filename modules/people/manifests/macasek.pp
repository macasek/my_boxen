class people::macasek {
  include baseline::environment

  $home     = "/Users/${::boxen_user}"

  # TODO: should do a pull if exists...
  # TODO: should set up links to dotfiles...
  repository { "${boxen::config::srcdir}/dotfiles":
    source  => "${home}/Dropbox/src/dotfiles",
    require => File[$::boxen::config::srcdir]
  }

  case $::hostname {
    'nightman': {
      file { "${boxen::config::srcdir}/dropbox":
        ensure  => link,
        target  => "${home}/Dropbox/src",
        mode    => '0755',
        require => Package['Dropbox'],
      }
    }

    'dayman': {
      file { "${boxen::config::srcdir}/dropbox":
        ensure  => link,
        target  => "/Volumes/Macintosh HD 2/Dropbox/src",
        mode    => '0755',
        require => Package['Dropbox'],
      }
    }

    default: {
      notify { "Wha?": }
    }
  }

  # Apps
  include adium
  include handbrake

  # Utils
  include osxfuse

  include osx::dock::dim_hidden_apps

  include osx::global::natural_mouse_scrolling

  class { 'osx::dock::icon_size':
    size => 48
  }

  git::config::global { 'user.email':
    value  => 'macasek@gmail.com'
  }

  git::config::global { 'user.name':
    value  => 'Michael Macasek'
  }
}