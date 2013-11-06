require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # default ruby versions
  include ruby::1_9_3
  include ruby::2_0_0

  include go

  # Apps
  include charles
  include chrome
  include dropbox
  include firefox
  include gimp
  include iterm2::stable
  include onyx
  include mou
  include mou::themes
  include mysql
  include redis

  # Utils
  include foreman
  include freetds
  include gcc
  include gh
  include homebrew
  include imagemagick
  include licecap
  include moreutils
  include phantomjs
  include pow
  include openssl
  include screen

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  class { 'ruby::global':
    version => '2.0.0'
  }

  go::version { '1.1.2': }
  phantomjs::version { '1.9.2': }

  ruby::gem { "bundler for 2.0.0":
    gem     => 'bundler',
    ruby    => '2.0.0'
  }

  ruby::gem { "dotenv for 2.0.0":
    gem     => 'dotenv',
    ruby    => '2.0.0'
  }

  ruby::gem { "bundler for 1.9.3":
    gem     => 'bundler',
    ruby    => '1.9.3'
  }

  ruby::gem { "dotenv for 1.9.3":
    gem     => 'dotenv',
    ruby    => '1.9.3'
  }

  ruby::plugin { 'rbenv-vars':
    ensure => 'v1.2.0',
    source  => 'sstephenson/rbenv-vars'
  }

  ruby::plugin { 'rbenv-gemset':
    ensure => 'v0.4.1',
    source  => 'jf/rbenv-gemset'
  }

  ruby::plugin { 'rbenv-use':
    ensure => 'v0.0.0',
    source  => 'rkh/rbenv-use'
  }
}
