class people::macasek::config {
  git::config::global { 'user.email':
    value => 'macasek@gmail.com'
  }

  git::config::global { 'user.name':
    value => 'Michael Macasek'
  }

  $home = "/Users/${::boxen_user}"

  case $::hostname {
    'nightman': {
      file { "${boxen::config::srcdir}/dropbox":
        ensure  => link,
        target  => "${home}/Dropbox/src",
        mode    => '0755',
        require => Package['Dropbox'],
      }

      file { "${boxen::config::srcdir}/dotfiles":
        ensure  => link,
        target  => "${home}/Dropbox/src/dotfiles",
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

      file { "${boxen::config::srcdir}/dotfiles":
        ensure  => link,
        target  => "/Volumes/Macintosh HD 2/Dropbox/src/dotfiles",
        mode    => '0755',
        require => Package['Dropbox'],
      }
    }

    default: {
      notify { "Wha? This host is not configured!!!": }
    }
  }
}