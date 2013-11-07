class people::macasek::dotfiles {
  $home = "/Users/${::boxen_user}"

  # TODO: should set up links to dotfiles...
  repository { "${boxen::config::srcdir}/dotfiles":
    source  => "${home}/Dropbox/src/dotfiles"
  }

  file { "/Users/${::luser}/.ssh/config":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.ssh/config",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.bash_profile":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.bash_profile",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.bashrc":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.bashrc",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.bundle":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.bundle",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  # file { "/Users/${::luser}/.gemrc":
  #   ensure  => link,
  #   mode    => '0644',
  #   target  => "${boxen::config::srcdir}/dotfiles/.gemrc",
  #   require => Repository["${boxen::config::srcdir}/dotfiles"],
  # }

  file { "/Users/${::luser}/.git":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.git",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.git-completion.sh":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.git-completion.sh",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.gitconfig":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.gitconfig",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.gitignore":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.gitignore",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.irbrc":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.irbrc",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.rvmrc":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.rvmrc",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.slate.js":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.slate.js",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.tm_properties":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.tm_properties",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }
}