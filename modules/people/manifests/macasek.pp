class people::macasek {
  $home     = "/Users/${::boxen_user}"

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
        target  => "/Volumes/Macintosh\ HD\ 2/Dropbox/src",
        mode    => '0755',
        require => Package['Dropbox'],
      }
    }

    default: {
      notify { "Wha?": }
    }
  }

  # Apps
  # include adium
  include handbrake
  include sublime_text_2

  # Utils
  include osxfuse

  file { "${boxen::config::bindir}/lime":
    ensure  => link,
    target  => '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl',
    mode    => '0755',
    require => Package['SublimeText2'],
  }

  # TODO add sublime config...
  # TODO add sublime packages...
  # sublime_text_2::package { 'Emmet':
  #   source => 'sergeche/emmet-sublime'
  # }

  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog

  include osx::dock::clear_dock
  include osx::dock::dim_hidden_apps

  include osx::finder::unhide_library

  include osx::disable_app_quarantine
  include osx::no_network_dsstores

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