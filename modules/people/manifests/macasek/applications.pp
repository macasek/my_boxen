class people::macasek::applications {
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

  package { "powder":
    ensure => installed,
    provider => "gem"
  }
}