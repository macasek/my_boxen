class people::macasek::dotfiles {
  $home = "/Users/${::boxen_user}"

  file { "/Users/${::boxen_user}/.ssh/config":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.ssh/config",
    require => File["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.bash_profile":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.bash_profile",
    require => File["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.bashrc":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.bashrc",
    require => File["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.bundle":
    ensure  => link,
    mode    => '0644',
    force   => true,
    target  => "${boxen::config::srcdir}/dotfiles/.bundle",
    require => File["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.git-completion.sh":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.git-completion.sh",
    require => File["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.gitconfig":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.gitconfig",
    require => File["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.irbrc":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.irbrc",
    require => File["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.slate.js":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.slate.js",
    require => File["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::boxen_user}/.tm_properties":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.tm_properties",
    require => File["${boxen::config::srcdir}/dotfiles"],
  }
}