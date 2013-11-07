class baseline::config {
  include config::go
  include config::osx
  include config::phantomjs
  include config::ruby
  include config::sublime

  file { "iTerm2 Preferences":
    path    => "/Users/${::boxen_user}/Library/Preferences/com.googlecode.iterm2.plist",
    source  => "puppet:///modules/baseline/com.googlecode.iterm2.plist",
    require => Package['iTerm'],
  }

  file { "Terminal Preferences":
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.Terminal.plist",
    source => "puppet:///modules/baseline/com.apple.Terminal.plist",
  }

  exec {"Disable Gatekeeper":
    command => "spctl --master-disable",
    unless => "spctl --status | grep -c disabled",
    user => "root", # Needs to be sudo 'cause it returns successfully and does nothing without it
  }

  file { "Enable Accessibility API":
    path => "/private/var/db/.AccessibilityAPIEnabled",
    content => "a",
    mode => "444",
    owner => "root"
  }

  property_list_key { 'Show GitX where git lives':
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/nl.frim.GitX.plist",
    key    => 'gitExecutable',
    value  => '/opt/boxen/homebrew/bin/git',
  }
}