class people::macasek::applications {
  # Apps
  include adium
  include handbrake

  # Utils
  # include osxfuse

  include osx::dock::dim_hidden_apps

  include osx::global::natural_mouse_scrolling

  class { 'osx::dock::icon_size':
    size => 48
  }

  package { "powder":
    ensure => installed,
    provider => "gem"
  }

  package { 'Dbvisualizer':
    ensure => installed,
    source => 'http://www.dbvis.com/product_download/dbvis-9.1.2/media/dbvis_macos_9_1_2.dmg',
    provider => pkgdmg
  }
}